require 'test_helper'

class VinesControllerTest < ActionController::TestCase
  setup do
    @vine = vines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vine" do
    assert_difference('Vine.count') do
      post :create, vine: { uri: @vine.uri, vineid: @vine.vineid }
    end

    assert_redirected_to vine_path(assigns(:vine))
  end

  test "should show vine" do
    get :show, id: @vine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vine
    assert_response :success
  end

  test "should update vine" do
    put :update, id: @vine, vine: { uri: @vine.uri, vineid: @vine.vineid }
    assert_redirected_to vine_path(assigns(:vine))
  end

  test "should destroy vine" do
    assert_difference('Vine.count', -1) do
      delete :destroy, id: @vine
    end

    assert_redirected_to vines_path
  end
end
