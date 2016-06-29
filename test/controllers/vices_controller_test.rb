require 'test_helper'

class VicesControllerTest < ActionController::TestCase
  setup do
    @vice = vices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vice" do
    assert_difference('Vice.count') do
      post :create, vice: { baseHeight: @vice.baseHeight, clampWidth: @vice.clampWidth, maxJawWidth: @vice.maxJawWidth, protectiveBasePlateHeight: @vice.protectiveBasePlateHeight, topHeight: @vice.topHeight, xLength: @vice.xLength, xPos: @vice.xPos, yLength: @vice.yLength, yPos: @vice.yPos, zPos: @vice.zPos }
    end

    assert_redirected_to vice_path(assigns(:vice))
  end

  test "should show vice" do
    get :show, id: @vice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vice
    assert_response :success
  end

  test "should update vice" do
    patch :update, id: @vice, vice: { baseHeight: @vice.baseHeight, clampWidth: @vice.clampWidth, maxJawWidth: @vice.maxJawWidth, protectiveBasePlateHeight: @vice.protectiveBasePlateHeight, topHeight: @vice.topHeight, xLength: @vice.xLength, xPos: @vice.xPos, yLength: @vice.yLength, yPos: @vice.yPos, zPos: @vice.zPos }
    assert_redirected_to vice_path(assigns(:vice))
  end

  test "should destroy vice" do
    assert_difference('Vice.count', -1) do
      delete :destroy, id: @vice
    end

    assert_redirected_to vices_path
  end
end
