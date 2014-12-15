require 'test_helper'

class SmbPullRequestsControllerTest < ActionController::TestCase
  setup do
    @smb_pull_request = smb_pull_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smb_pull_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smb_pull_request" do
    assert_difference('SmbPullRequest.count') do
      post :create, smb_pull_request: { display_name: @smb_pull_request.display_name, html_url: @smb_pull_request.html_url, name: @smb_pull_request.name, opened_at: @smb_pull_request.opened_at, url: @smb_pull_request.url }
    end

    assert_redirected_to smb_pull_request_path(assigns(:smb_pull_request))
  end

  test "should show smb_pull_request" do
    get :show, id: @smb_pull_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smb_pull_request
    assert_response :success
  end

  test "should update smb_pull_request" do
    patch :update, id: @smb_pull_request, smb_pull_request: { display_name: @smb_pull_request.display_name, html_url: @smb_pull_request.html_url, name: @smb_pull_request.name, opened_at: @smb_pull_request.opened_at, url: @smb_pull_request.url }
    assert_redirected_to smb_pull_request_path(assigns(:smb_pull_request))
  end

  test "should destroy smb_pull_request" do
    assert_difference('SmbPullRequest.count', -1) do
      delete :destroy, id: @smb_pull_request
    end

    assert_redirected_to smb_pull_requests_path
  end
end
