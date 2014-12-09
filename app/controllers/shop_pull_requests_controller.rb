class ShopPullRequestsController < ApplicationController
  before_action :set_shop_pull_request, only: [:show, :edit, :update, :destroy]

  # GET /shop_pull_requests
  # GET /shop_pull_requests.json
  def index
    @shop_pull_requests = ShopPullRequest.all
  end

  # GET /shop_pull_requests/1
  # GET /shop_pull_requests/1.json
  def show
  end

  # GET /shop_pull_requests/new
  def new
    @shop_pull_request = ShopPullRequest.new
  end

  # GET /shop_pull_requests/1/edit
  def edit
  end

  # POST /shop_pull_requests
  # POST /shop_pull_requests.json
  def create
    @shop_pull_request = ShopPullRequest.new(shop_pull_request_params)

    respond_to do |format|
      if @shop_pull_request.save
        format.html { redirect_to @shop_pull_request, notice: 'Shop pull request was successfully created.' }
        format.json { render :show, status: :created, location: @shop_pull_request }
      else
        format.html { render :new }
        format.json { render json: @shop_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_pull_requests/1
  # PATCH/PUT /shop_pull_requests/1.json
  def update
    respond_to do |format|
      if @shop_pull_request.update(shop_pull_request_params)
        format.html { redirect_to @shop_pull_request, notice: 'Shop pull request was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_pull_request }
      else
        format.html { render :edit }
        format.json { render json: @shop_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_pull_requests/1
  # DELETE /shop_pull_requests/1.json
  def destroy
    @shop_pull_request.destroy
    respond_to do |format|
      format.html { redirect_to shop_pull_requests_url, notice: 'Shop pull request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_pull_request
      @shop_pull_request = ShopPullRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_pull_request_params
      params.require(:shop_pull_request).permit(:url, :opened_at, :html_url, :name, :display_name)
    end
end
