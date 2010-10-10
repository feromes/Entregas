require 'test_helper'

class CecsControllerTest < ActionController::TestCase
  setup do
    @cec = cecs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cecs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cec" do
    assert_difference('Cec.count') do
      post :create, :cec => @cec.attributes
    end

    assert_redirected_to cec_path(assigns(:cec))
  end

  test "should show cec" do
    get :show, :id => @cec.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cec.to_param
    assert_response :success
  end

  test "should update cec" do
    put :update, :id => @cec.to_param, :cec => @cec.attributes
    assert_redirected_to cec_path(assigns(:cec))
  end

  test "should destroy cec" do
    assert_difference('Cec.count', -1) do
      delete :destroy, :id => @cec.to_param
    end

    assert_redirected_to cecs_path
  end
end
