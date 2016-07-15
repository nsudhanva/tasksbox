require 'test_helper'

class SandboxControllerTest < ActionController::TestCase
  test "should get clients" do
    get :clients
    assert_response :success
  end

end
