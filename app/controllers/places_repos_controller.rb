class PlacesReposController < ApplicationController
  before_action :set_places_repo, only: [:show, :edit, :update, :destroy]

  # GET /places_repos
  # GET /places_repos.json
  def index
    @places_repos = PlacesRepo.all
  end

  # GET /places_repos/1
  # GET /places_repos/1.json
  def show
  end

  # GET /places_repos/new
  def new
    @places_repo = PlacesRepo.new
  end

  # GET /places_repos/1/edit
  def edit
  end

  # POST /places_repos
  # POST /places_repos.json
  def create
    @places_repo = PlacesRepo.new(places_repo_params)

    respond_to do |format|
      if @places_repo.save
        format.html { redirect_to @places_repo, notice: 'Places repo was successfully created.' }
        format.json { render :show, status: :created, location: @places_repo }
      else
        format.html { render :new }
        format.json { render json: @places_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places_repos/1
  # PATCH/PUT /places_repos/1.json
  def update
    respond_to do |format|
      if @places_repo.update(places_repo_params)
        format.html { redirect_to @places_repo, notice: 'Places repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @places_repo }
      else
        format.html { render :edit }
        format.json { render json: @places_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places_repos/1
  # DELETE /places_repos/1.json
  def destroy
    @places_repo.destroy
    respond_to do |format|
      format.html { redirect_to places_repos_url, notice: 'Places repo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_places_repo
      @places_repo = PlacesRepo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def places_repo_params
      params.require(:places_repo).permit(:url)
    end
end
