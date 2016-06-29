require 'test_helper'

class FabPlanControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get download" do
    get :download
    assert_response :success
  end

end
