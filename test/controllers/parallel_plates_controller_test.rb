require 'test_helper'

class ParallelPlatesControllerTest < ActionController::TestCase
  setup do
    @parallel_plate = parallel_plates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parallel_plates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parallel_plate" do
    assert_difference('ParallelPlate.count') do
      post :create, parallel_plate: { height: @parallel_plate.height }
    end

    assert_redirected_to parallel_plate_path(assigns(:parallel_plate))
  end

  test "should show parallel_plate" do
    get :show, id: @parallel_plate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parallel_plate
    assert_response :success
  end

  test "should update parallel_plate" do
    patch :update, id: @parallel_plate, parallel_plate: { height: @parallel_plate.height }
    assert_redirected_to parallel_plate_path(assigns(:parallel_plate))
  end

  test "should destroy parallel_plate" do
    assert_difference('ParallelPlate.count', -1) do
      delete :destroy, id: @parallel_plate
    end

    assert_redirected_to parallel_plates_path
  end
end
