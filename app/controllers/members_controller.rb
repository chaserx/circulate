class MembersController < ApplicationController

  before_action :authenticate_user!
  
  def history
    @loans = current_member.loans.order(ended_at: :desc)
    # This could be appended to only show items that have been checked in
    # if it's decided this page shouldn't show currently checked-out items:
    # .where.not(loans: { ended_at: nil })
  end

  def renew
    @loan = Loan.find(params[:id])
    authorize @loan, :renew?

    @loan.renew!
    redirect_to account_home_path
  end
end
