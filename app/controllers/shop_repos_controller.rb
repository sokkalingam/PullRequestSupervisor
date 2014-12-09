class ShopReposController < ApplicationController
  before_action :set_shop_repo, only: [:show, :edit, :update, :destroy]

  # GET /shop_repos
  # GET /shop_repos.json
  def index
    @shop_repos = ShopRepo.all
  end

  # GET /shop_repos/1
  # GET /shop_repos/1.json
  def show
  end

  # GET /shop_repos/new
  def new
    @shop_repo = ShopRepo.new
  end

  # GET /shop_repos/1/edit
  def edit
  end

  # POST /shop_repos
  # POST /shop_repos.json
  def create
    @shop_repo = ShopRepo.new(shop_repo_params)

    respond_to do |format|
      if @shop_repo.save
        format.html { redirect_to @shop_repo, notice: 'Shop repo was successfully created.' }
        format.json { render :show, status: :created, location: @shop_repo }
      else
        format.html { render :new }
        format.json { render json: @shop_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_repos/1
  # PATCH/PUT /shop_repos/1.json
  def update
    respond_to do |format|
      if @shop_repo.update(shop_repo_params)
        format.html { redirect_to @shop_repo, notice: 'Shop repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_repo }
      else
        format.html { render :edit }
        format.json { render json: @shop_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_repos/1
  # DELETE /shop_repos/1.json
  def destroy
    @shop_repo.destroy
    respond_to do |format|
      format.html { redirect_to shop_repos_url, notice: 'Shop repo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_repo
      @shop_repo = ShopRepo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_repo_params
      params.require(:shop_repo).permit(:url)
    end
end
