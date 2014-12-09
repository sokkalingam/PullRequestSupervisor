require 'test_helper'

class ShopPullRequestsControllerTest < ActionController::TestCase
  setup do
    @shop_pull_request = shop_pull_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_pull_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_pull_request" do
    assert_difference('ShopPullRequest.count') do
      post :create, shop_pull_request: { display_name: @shop_pull_request.display_name, html_url: @shop_pull_request.html_url, name: @shop_pull_request.name, opened_at: @shop_pull_request.opened_at, url: @shop_pull_request.url }
    end

    assert_redirected_to shop_pull_request_path(assigns(:shop_pull_request))
  end

  test "should show shop_pull_request" do
    get :show, id: @shop_pull_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_pull_request
    assert_response :success
  end

  test "should update shop_pull_request" do
    patch :update, id: @shop_pull_request, shop_pull_request: { display_name: @shop_pull_request.display_name, html_url: @shop_pull_request.html_url, name: @shop_pull_request.name, opened_at: @shop_pull_request.opened_at, url: @shop_pull_request.url }
    assert_redirected_to shop_pull_request_path(assigns(:shop_pull_request))
  end

  test "should destroy shop_pull_request" do
    assert_difference('ShopPullRequest.count', -1) do
      delete :destroy, id: @shop_pull_request
    end

    assert_redirected_to shop_pull_requests_path
  end
end
