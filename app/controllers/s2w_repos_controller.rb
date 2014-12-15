class S2wReposController < ApplicationController
  before_action :set_s2w_repo, only: [:show, :edit, :update, :destroy]

  # GET /s2w_repos
  # GET /s2w_repos.json
  def index
    @s2w_repos = S2wRepo.all
  end

  # GET /s2w_repos/1
  # GET /s2w_repos/1.json
  def show
  end

  # GET /s2w_repos/new
  def new
    @s2w_repo = S2wRepo.new
  end

  # GET /s2w_repos/1/edit
  def edit
  end

  # POST /s2w_repos
  # POST /s2w_repos.json
  def create
    @s2w_repo = S2wRepo.new(s2w_repo_params)

    respond_to do |format|
      if @s2w_repo.save
        format.html { redirect_to @s2w_repo, notice: 'S2w repo was successfully created.' }
        format.json { render :show, status: :created, location: @s2w_repo }
      else
        format.html { render :new }
        format.json { render json: @s2w_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s2w_repos/1
  # PATCH/PUT /s2w_repos/1.json
  def update
    respond_to do |format|
      if @s2w_repo.update(s2w_repo_params)
        format.html { redirect_to @s2w_repo, notice: 'S2w repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @s2w_repo }
      else
        format.html { render :edit }
        format.json { render json: @s2w_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s2w_repos/1
  # DELETE /s2w_repos/1.json
  def destroy
    @s2w_repo.destroy
    respond_to do |format|
      format.html { redirect_to s2w_repos_url, notice: 'S2w repo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s2w_repo
      @s2w_repo = S2wRepo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def s2w_repo_params
      params.require(:s2w_repo).permit(:url)
    end
end
