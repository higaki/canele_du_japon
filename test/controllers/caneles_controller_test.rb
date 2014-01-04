require 'test_helper'

class CanelesControllerTest < ActionController::TestCase
  setup do
    @canele = caneles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caneles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canele" do
    assert_difference('Canele.count') do
      post :create, canele: { discontinued_in: @canele.discontinued_in, name: @canele.name, price: @canele.price, started_from: @canele.started_from }
    end

    assert_redirected_to canele_path(assigns(:canele))
  end

  test "should show canele" do
    get :show, id: @canele
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canele
    assert_response :success
  end

  test "should update canele" do
    patch :update, id: @canele, canele: { discontinued_in: @canele.discontinued_in, name: @canele.name, price: @canele.price, started_from: @canele.started_from }
    assert_redirected_to canele_path(assigns(:canele))
  end

  test "should destroy canele" do
    assert_difference('Canele.count', -1) do
      delete :destroy, id: @canele
    end

    assert_redirected_to caneles_path
  end
end
