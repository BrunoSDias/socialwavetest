require 'test_helper'

class Admin::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_login_index_url
    assert_response :success
  end

end
