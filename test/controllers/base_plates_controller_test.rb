require 'test_helper'

class BasePlatesControllerTest < ActionController::TestCase
  setup do
    @base_plate = base_plates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_plates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_plate" do
    assert_difference('BasePlate.count') do
      post :create, base_plate: { height: @base_plate.height }
    end

    assert_redirected_to base_plate_path(assigns(:base_plate))
  end

  test "should show base_plate" do
    get :show, id: @base_plate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_plate
    assert_response :success
  end

  test "should update base_plate" do
    patch :update, id: @base_plate, base_plate: { height: @base_plate.height }
    assert_redirected_to base_plate_path(assigns(:base_plate))
  end

  test "should destroy base_plate" do
    assert_difference('BasePlate.count', -1) do
      delete :destroy, id: @base_plate
    end

    assert_redirected_to base_plates_path
  end
end
