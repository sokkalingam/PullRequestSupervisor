require 'test_helper'

class S2wPullRequestsControllerTest < ActionController::TestCase
  setup do
    @s2w_pull_request = s2w_pull_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:s2w_pull_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create s2w_pull_request" do
    assert_difference('S2wPullRequest.count') do
      post :create, s2w_pull_request: { display_name: @s2w_pull_request.display_name, html_url: @s2w_pull_request.html_url, name: @s2w_pull_request.name, opened_at: @s2w_pull_request.opened_at, url: @s2w_pull_request.url }
    end

    assert_redirected_to s2w_pull_request_path(assigns(:s2w_pull_request))
  end

  test "should show s2w_pull_request" do
    get :show, id: @s2w_pull_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @s2w_pull_request
    assert_response :success
  end

  test "should update s2w_pull_request" do
    patch :update, id: @s2w_pull_request, s2w_pull_request: { display_name: @s2w_pull_request.display_name, html_url: @s2w_pull_request.html_url, name: @s2w_pull_request.name, opened_at: @s2w_pull_request.opened_at, url: @s2w_pull_request.url }
    assert_redirected_to s2w_pull_request_path(assigns(:s2w_pull_request))
  end

  test "should destroy s2w_pull_request" do
    assert_difference('S2wPullRequest.count', -1) do
      delete :destroy, id: @s2w_pull_request
    end

    assert_redirected_to s2w_pull_requests_path
  end
end
