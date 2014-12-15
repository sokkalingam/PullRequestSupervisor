class SmbUsersController < ApplicationController
  before_action :set_smb_user, only: [:show, :edit, :update, :destroy]

  # GET /smb_users
  # GET /smb_users.json
  def index
    @smb_users = SmbUser.all
  end

  # GET /smb_users/1
  # GET /smb_users/1.json
  def show
  end

  # GET /smb_users/new
  def new
    @smb_user = SmbUser.new
  end

  # GET /smb_users/1/edit
  def edit
  end

  # POST /smb_users
  # POST /smb_users.json
  def create
    @smb_user = SmbUser.new(smb_user_params)

    respond_to do |format|
      if @smb_user.save
        format.html { redirect_to @smb_user, notice: 'Smb user was successfully created.' }
        format.json { render :show, status: :created, location: @smb_user }
      else
        format.html { render :new }
        format.json { render json: @smb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smb_users/1
  # PATCH/PUT /smb_users/1.json
  def update
    respond_to do |format|
      if @smb_user.update(smb_user_params)
        format.html { redirect_to @smb_user, notice: 'Smb user was successfully updated.' }
        format.json { render :show, status: :ok, location: @smb_user }
      else
        format.html { render :edit }
        format.json { render json: @smb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smb_users/1
  # DELETE /smb_users/1.json
  def destroy
    @smb_user.destroy
    respond_to do |format|
      format.html { redirect_to smb_users_url, notice: 'Smb user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smb_user
      @smb_user = SmbUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smb_user_params
      params.require(:smb_user).permit(:name, :display_name, :last_commented, :last_merged)
    end
end
