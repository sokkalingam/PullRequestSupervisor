require 'test_helper'

class SmbUsersControllerTest < ActionController::TestCase
  setup do
    @smb_user = smb_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smb_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smb_user" do
    assert_difference('SmbUser.count') do
      post :create, smb_user: { display_name: @smb_user.display_name, last_commented: @smb_user.last_commented, last_merged: @smb_user.last_merged, name: @smb_user.name }
    end

    assert_redirected_to smb_user_path(assigns(:smb_user))
  end

  test "should show smb_user" do
    get :show, id: @smb_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smb_user
    assert_response :success
  end

  test "should update smb_user" do
    patch :update, id: @smb_user, smb_user: { display_name: @smb_user.display_name, last_commented: @smb_user.last_commented, last_merged: @smb_user.last_merged, name: @smb_user.name }
    assert_redirected_to smb_user_path(assigns(:smb_user))
  end

  test "should destroy smb_user" do
    assert_difference('SmbUser.count', -1) do
      delete :destroy, id: @smb_user
    end

    assert_redirected_to smb_users_path
  end
end
