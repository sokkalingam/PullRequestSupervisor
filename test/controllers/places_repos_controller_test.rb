require 'test_helper'

class PlacesReposControllerTest < ActionController::TestCase
  setup do
    @places_repo = places_repos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places_repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create places_repo" do
    assert_difference('PlacesRepo.count') do
      post :create, places_repo: { url: @places_repo.url }
    end

    assert_redirected_to places_repo_path(assigns(:places_repo))
  end

  test "should show places_repo" do
    get :show, id: @places_repo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @places_repo
    assert_response :success
  end

  test "should update places_repo" do
    patch :update, id: @places_repo, places_repo: { url: @places_repo.url }
    assert_redirected_to places_repo_path(assigns(:places_repo))
  end

  test "should destroy places_repo" do
    assert_difference('PlacesRepo.count', -1) do
      delete :destroy, id: @places_repo
    end

    assert_redirected_to places_repos_path
  end
end
