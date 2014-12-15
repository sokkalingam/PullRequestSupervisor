class S2wPullRequestsController < ApplicationController
  before_action :set_s2w_pull_request, only: [:show, :edit, :update, :destroy]

  # GET /s2w_pull_requests
  # GET /s2w_pull_requests.json
  def index
    @s2w_pull_requests = S2wPullRequest.all
  end

  # GET /s2w_pull_requests/1
  # GET /s2w_pull_requests/1.json
  def show
  end

  # GET /s2w_pull_requests/new
  def new
    @s2w_pull_request = S2wPullRequest.new
  end

  # GET /s2w_pull_requests/1/edit
  def edit
  end

  # POST /s2w_pull_requests
  # POST /s2w_pull_requests.json
  def create
    @s2w_pull_request = S2wPullRequest.new(s2w_pull_request_params)

    respond_to do |format|
      if @s2w_pull_request.save
        format.html { redirect_to @s2w_pull_request, notice: 'S2w pull request was successfully created.' }
        format.json { render :show, status: :created, location: @s2w_pull_request }
      else
        format.html { render :new }
        format.json { render json: @s2w_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s2w_pull_requests/1
  # PATCH/PUT /s2w_pull_requests/1.json
  def update
    respond_to do |format|
      if @s2w_pull_request.update(s2w_pull_request_params)
        format.html { redirect_to @s2w_pull_request, notice: 'S2w pull request was successfully updated.' }
        format.json { render :show, status: :ok, location: @s2w_pull_request }
      else
        format.html { render :edit }
        format.json { render json: @s2w_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s2w_pull_requests/1
  # DELETE /s2w_pull_requests/1.json
  def destroy
    @s2w_pull_request.destroy
    respond_to do |format|
      format.html { redirect_to s2w_pull_requests_url, notice: 'S2w pull request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s2w_pull_request
      @s2w_pull_request = S2wPullRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def s2w_pull_request_params
      params.require(:s2w_pull_request).permit(:url, :name, :display_name, :html_url, :opened_at)
    end
end
