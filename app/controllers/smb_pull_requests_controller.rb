class SmbPullRequestsController < ApplicationController
  before_action :set_smb_pull_request, only: [:show, :edit, :update, :destroy]

  # GET /smb_pull_requests
  # GET /smb_pull_requests.json
  def index
    @smb_pull_requests = SmbPullRequest.all
  end

  # GET /smb_pull_requests/1
  # GET /smb_pull_requests/1.json
  def show
  end

  # GET /smb_pull_requests/new
  def new
    @smb_pull_request = SmbPullRequest.new
  end

  # GET /smb_pull_requests/1/edit
  def edit
  end

  # POST /smb_pull_requests
  # POST /smb_pull_requests.json
  def create
    @smb_pull_request = SmbPullRequest.new(smb_pull_request_params)

    respond_to do |format|
      if @smb_pull_request.save
        format.html { redirect_to @smb_pull_request, notice: 'Smb pull request was successfully created.' }
        format.json { render :show, status: :created, location: @smb_pull_request }
      else
        format.html { render :new }
        format.json { render json: @smb_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smb_pull_requests/1
  # PATCH/PUT /smb_pull_requests/1.json
  def update
    respond_to do |format|
      if @smb_pull_request.update(smb_pull_request_params)
        format.html { redirect_to @smb_pull_request, notice: 'Smb pull request was successfully updated.' }
        format.json { render :show, status: :ok, location: @smb_pull_request }
      else
        format.html { render :edit }
        format.json { render json: @smb_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smb_pull_requests/1
  # DELETE /smb_pull_requests/1.json
  def destroy
    @smb_pull_request.destroy
    respond_to do |format|
      format.html { redirect_to smb_pull_requests_url, notice: 'Smb pull request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smb_pull_request
      @smb_pull_request = SmbPullRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smb_pull_request_params
      params.require(:smb_pull_request).permit(:url, :name, :display_name, :html_url, :opened_at)
    end
end
