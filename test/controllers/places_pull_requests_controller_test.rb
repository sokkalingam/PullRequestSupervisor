require 'test_helper'

class PlacesPullRequestsControllerTest < ActionController::TestCase
  setup do
    @places_pull_request = places_pull_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places_pull_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create places_pull_request" do
    assert_difference('PlacesPullRequest.count') do
      post :create, places_pull_request: { display_name: @places_pull_request.display_name, html_url: @places_pull_request.html_url, name: @places_pull_request.name, opened_at: @places_pull_request.opened_at, url: @places_pull_request.url }
    end

    assert_redirected_to places_pull_request_path(assigns(:places_pull_request))
  end

  test "should show places_pull_request" do
    get :show, id: @places_pull_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @places_pull_request
    assert_response :success
  end

  test "should update places_pull_request" do
    patch :update, id: @places_pull_request, places_pull_request: { display_name: @places_pull_request.display_name, html_url: @places_pull_request.html_url, name: @places_pull_request.name, opened_at: @places_pull_request.opened_at, url: @places_pull_request.url }
    assert_redirected_to places_pull_request_path(assigns(:places_pull_request))
  end

  test "should destroy places_pull_request" do
    assert_difference('PlacesPullRequest.count', -1) do
      delete :destroy, id: @places_pull_request
    end

    assert_redirected_to places_pull_requests_path
  end
end
