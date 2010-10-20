require 'test_helper'

class EntregadorsControllerTest < ActionController::TestCase
  setup do
    @entregador = entregadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entregadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entregador" do
    assert_difference('Entregador.count') do
      post :create, :entregador => @entregador.attributes
    end

    assert_redirected_to entregador_path(assigns(:entregador))
  end

  test "should show entregador" do
    get :show, :id => @entregador.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @entregador.to_param
    assert_response :success
  end

  test "should update entregador" do
    put :update, :id => @entregador.to_param, :entregador => @entregador.attributes
    assert_redirected_to entregador_path(assigns(:entregador))
  end

  test "should destroy entregador" do
    assert_difference('Entregador.count', -1) do
      delete :destroy, :id => @entregador.to_param
    end

    assert_redirected_to entregadors_path
  end
end
