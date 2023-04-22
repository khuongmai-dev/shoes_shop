require "test_helper"

class ShopUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shop_users_show_url
    assert_response :success
  end
end
