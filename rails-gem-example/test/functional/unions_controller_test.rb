require 'test_helper'

class UnionsControllerTest < ActionController::TestCase
  setup do
    @union = unions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create union" do
    assert_difference('Union.count') do
      post :create, union: { name: @union.name }
    end

    assert_redirected_to union_path(assigns(:union))
  end

  test "should show union" do
    get :show, id: @union
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @union
    assert_response :success
  end

  test "should update union" do
    put :update, id: @union, union: { name: @union.name }
    assert_redirected_to union_path(assigns(:union))
  end

  test "should destroy union" do
    assert_difference('Union.count', -1) do
      delete :destroy, id: @union
    end

    assert_redirected_to unions_path
  end
end
