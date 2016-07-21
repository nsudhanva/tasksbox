require 'test_helper'

class TaskControllerTest < ActionController::TestCase
  test "should get tasks" do
    get :tasks
    assert_response :success
  end

end
