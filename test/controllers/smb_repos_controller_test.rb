require 'test_helper'

class SmbReposControllerTest < ActionController::TestCase
  setup do
    @smb_repo = smb_repos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smb_repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smb_repo" do
    assert_difference('SmbRepo.count') do
      post :create, smb_repo: { url: @smb_repo.url }
    end

    assert_redirected_to smb_repo_path(assigns(:smb_repo))
  end

  test "should show smb_repo" do
    get :show, id: @smb_repo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smb_repo
    assert_response :success
  end

  test "should update smb_repo" do
    patch :update, id: @smb_repo, smb_repo: { url: @smb_repo.url }
    assert_redirected_to smb_repo_path(assigns(:smb_repo))
  end

  test "should destroy smb_repo" do
    assert_difference('SmbRepo.count', -1) do
      delete :destroy, id: @smb_repo
    end

    assert_redirected_to smb_repos_path
  end
end
