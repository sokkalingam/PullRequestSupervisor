require 'test_helper'

class S2wUsersControllerTest < ActionController::TestCase
  setup do
    @s2w_user = s2w_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:s2w_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create s2w_user" do
    assert_difference('S2wUser.count') do
      post :create, s2w_user: { display_name: @s2w_user.display_name, last_commented: @s2w_user.last_commented, last_merged: @s2w_user.last_merged, name: @s2w_user.name }
    end

    assert_redirected_to s2w_user_path(assigns(:s2w_user))
  end

  test "should show s2w_user" do
    get :show, id: @s2w_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @s2w_user
    assert_response :success
  end

  test "should update s2w_user" do
    patch :update, id: @s2w_user, s2w_user: { display_name: @s2w_user.display_name, last_commented: @s2w_user.last_commented, last_merged: @s2w_user.last_merged, name: @s2w_user.name }
    assert_redirected_to s2w_user_path(assigns(:s2w_user))
  end

  test "should destroy s2w_user" do
    assert_difference('S2wUser.count', -1) do
      delete :destroy, id: @s2w_user
    end

    assert_redirected_to s2w_users_path
  end
end
