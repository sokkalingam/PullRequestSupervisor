require 'test_helper'

class ShopReposControllerTest < ActionController::TestCase
  setup do
    @shop_repo = shop_repos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_repo" do
    assert_difference('ShopRepo.count') do
      post :create, shop_repo: { url: @shop_repo.url }
    end

    assert_redirected_to shop_repo_path(assigns(:shop_repo))
  end

  test "should show shop_repo" do
    get :show, id: @shop_repo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_repo
    assert_response :success
  end

  test "should update shop_repo" do
    patch :update, id: @shop_repo, shop_repo: { url: @shop_repo.url }
    assert_redirected_to shop_repo_path(assigns(:shop_repo))
  end

  test "should destroy shop_repo" do
    assert_difference('ShopRepo.count', -1) do
      delete :destroy, id: @shop_repo
    end

    assert_redirected_to shop_repos_path
  end
end
