require "test_helper"

module Admin
  class MonthlyAdjustmentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = create(:admin_user)
      sign_in @user
    end

    test "should get index" do
      create(:fine_adjustment)
      create(:membership_adjustment)
      create(:cash_payment_adjustment)
      create(:square_payment_adjustment)

      get admin_monthly_adjustments_url
      assert_response :success
    end
  end
end
