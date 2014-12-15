require 'test_helper'

class S2wReposControllerTest < ActionController::TestCase
  setup do
    @s2w_repo = s2w_repos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:s2w_repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create s2w_repo" do
    assert_difference('S2wRepo.count') do
      post :create, s2w_repo: { url: @s2w_repo.url }
    end

    assert_redirected_to s2w_repo_path(assigns(:s2w_repo))
  end

  test "should show s2w_repo" do
    get :show, id: @s2w_repo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @s2w_repo
    assert_response :success
  end

  test "should update s2w_repo" do
    patch :update, id: @s2w_repo, s2w_repo: { url: @s2w_repo.url }
    assert_redirected_to s2w_repo_path(assigns(:s2w_repo))
  end

  test "should destroy s2w_repo" do
    assert_difference('S2wRepo.count', -1) do
      delete :destroy, id: @s2w_repo
    end

    assert_redirected_to s2w_repos_path
  end
end
