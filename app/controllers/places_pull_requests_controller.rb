class PlacesPullRequestsController < ApplicationController
  before_action :set_places_pull_request, only: [:show, :edit, :update, :destroy]

  # GET /places_pull_requests
  # GET /places_pull_requests.json
  def index
    @places_pull_requests = PlacesPullRequest.all
  end

  # GET /places_pull_requests/1
  # GET /places_pull_requests/1.json
  def show
  end

  # GET /places_pull_requests/new
  def new
    @places_pull_request = PlacesPullRequest.new
  end

  # GET /places_pull_requests/1/edit
  def edit
  end

  # POST /places_pull_requests
  # POST /places_pull_requests.json
  def create
    @places_pull_request = PlacesPullRequest.new(places_pull_request_params)

    respond_to do |format|
      if @places_pull_request.save
        format.html { redirect_to @places_pull_request, notice: 'Places pull request was successfully created.' }
        format.json { render :show, status: :created, location: @places_pull_request }
      else
        format.html { render :new }
        format.json { render json: @places_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places_pull_requests/1
  # PATCH/PUT /places_pull_requests/1.json
  def update
    respond_to do |format|
      if @places_pull_request.update(places_pull_request_params)
        format.html { redirect_to @places_pull_request, notice: 'Places pull request was successfully updated.' }
        format.json { render :show, status: :ok, location: @places_pull_request }
      else
        format.html { render :edit }
        format.json { render json: @places_pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places_pull_requests/1
  # DELETE /places_pull_requests/1.json
  def destroy
    @places_pull_request.destroy
    respond_to do |format|
      format.html { redirect_to places_pull_requests_url, notice: 'Places pull request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_places_pull_request
      @places_pull_request = PlacesPullRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def places_pull_request_params
      params.require(:places_pull_request).permit(:url, :name, :display_name, :html_url, :opened_at)
    end
end
