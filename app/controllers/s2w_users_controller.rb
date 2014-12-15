class S2wUsersController < ApplicationController
  before_action :set_s2w_user, only: [:show, :edit, :update, :destroy]

  # GET /s2w_users
  # GET /s2w_users.json
  def index
    @s2w_users = S2wUser.all
  end

  # GET /s2w_users/1
  # GET /s2w_users/1.json
  def show
  end

  # GET /s2w_users/new
  def new
    @s2w_user = S2wUser.new
  end

  # GET /s2w_users/1/edit
  def edit
  end

  # POST /s2w_users
  # POST /s2w_users.json
  def create
    @s2w_user = S2wUser.new(s2w_user_params)

    respond_to do |format|
      if @s2w_user.save
        format.html { redirect_to @s2w_user, notice: 'S2w user was successfully created.' }
        format.json { render :show, status: :created, location: @s2w_user }
      else
        format.html { render :new }
        format.json { render json: @s2w_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s2w_users/1
  # PATCH/PUT /s2w_users/1.json
  def update
    respond_to do |format|
      if @s2w_user.update(s2w_user_params)
        format.html { redirect_to @s2w_user, notice: 'S2w user was successfully updated.' }
        format.json { render :show, status: :ok, location: @s2w_user }
      else
        format.html { render :edit }
        format.json { render json: @s2w_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s2w_users/1
  # DELETE /s2w_users/1.json
  def destroy
    @s2w_user.destroy
    respond_to do |format|
      format.html { redirect_to s2w_users_url, notice: 'S2w user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s2w_user
      @s2w_user = S2wUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def s2w_user_params
      params.require(:s2w_user).permit(:name, :display_name, :last_commented, :last_merged)
    end
end
