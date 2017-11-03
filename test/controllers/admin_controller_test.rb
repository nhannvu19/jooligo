require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get administrator" do
    get admin_administrator_url
    assert_response :success
  end

end
