class ShopUsersController < ApplicationController
  before_action :set_shop_user, only: [:show, :edit, :update, :destroy]

  # GET /shop_users
  # GET /shop_users.json
  def index
    @shop_users = ShopUser.all
  end

  # GET /shop_users/1
  # GET /shop_users/1.json
  def show
  end

  # GET /shop_users/new
  def new
    @shop_user = ShopUser.new
  end

  # GET /shop_users/1/edit
  def edit
  end

  # POST /shop_users
  # POST /shop_users.json
  def create
    @shop_user = ShopUser.new(shop_user_params)

    respond_to do |format|
      if @shop_user.save
        format.html { redirect_to @shop_user, notice: 'Shop user was successfully created.' }
        format.json { render :show, status: :created, location: @shop_user }
      else
        format.html { render :new }
        format.json { render json: @shop_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_users/1
  # PATCH/PUT /shop_users/1.json
  def update
    respond_to do |format|
      if @shop_user.update(shop_user_params)
        format.html { redirect_to @shop_user, notice: 'Shop user was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_user }
      else
        format.html { render :edit }
        format.json { render json: @shop_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_users/1
  # DELETE /shop_users/1.json
  def destroy
    @shop_user.destroy
    respond_to do |format|
      format.html { redirect_to shop_users_url, notice: 'Shop user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_user
      @shop_user = ShopUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_user_params
      params.require(:shop_user).permit(:name, :last_commented, :last_merged, :display_name)
    end
end
