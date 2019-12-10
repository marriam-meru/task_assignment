require 'test_helper'

class CheckinCheckoutHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get checkin_checkout_history_new_url
    assert_response :success
  end

  test "should get create" do
    get checkin_checkout_history_create_url
    assert_response :success
  end

  test "should get show" do
    get checkin_checkout_history_show_url
    assert_response :success
  end

end
