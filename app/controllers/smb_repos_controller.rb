class SmbReposController < ApplicationController
  before_action :set_smb_repo, only: [:show, :edit, :update, :destroy]

  # GET /smb_repos
  # GET /smb_repos.json
  def index
    @smb_repos = SmbRepo.all
  end

  # GET /smb_repos/1
  # GET /smb_repos/1.json
  def show
  end

  # GET /smb_repos/new
  def new
    @smb_repo = SmbRepo.new
  end

  # GET /smb_repos/1/edit
  def edit
  end

  # POST /smb_repos
  # POST /smb_repos.json
  def create
    @smb_repo = SmbRepo.new(smb_repo_params)

    respond_to do |format|
      if @smb_repo.save
        format.html { redirect_to @smb_repo, notice: 'Smb repo was successfully created.' }
        format.json { render :show, status: :created, location: @smb_repo }
      else
        format.html { render :new }
        format.json { render json: @smb_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smb_repos/1
  # PATCH/PUT /smb_repos/1.json
  def update
    respond_to do |format|
      if @smb_repo.update(smb_repo_params)
        format.html { redirect_to @smb_repo, notice: 'Smb repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @smb_repo }
      else
        format.html { render :edit }
        format.json { render json: @smb_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smb_repos/1
  # DELETE /smb_repos/1.json
  def destroy
    @smb_repo.destroy
    respond_to do |format|
      format.html { redirect_to smb_repos_url, notice: 'Smb repo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smb_repo
      @smb_repo = SmbRepo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smb_repo_params
      params.require(:smb_repo).permit(:url)
    end
end
