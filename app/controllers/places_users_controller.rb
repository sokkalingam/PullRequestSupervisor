class PlacesUsersController < ApplicationController
  before_action :set_places_user, only: [:show, :edit, :update, :destroy]

  # GET /places_users
  # GET /places_users.json
  def index
    @places_users = PlacesUser.all
  end

  # GET /places_users/1
  # GET /places_users/1.json
  def show
  end

  # GET /places_users/new
  def new
    @places_user = PlacesUser.new
  end

  # GET /places_users/1/edit
  def edit
  end

  # POST /places_users
  # POST /places_users.json
  def create
    @places_user = PlacesUser.new(places_user_params)

    respond_to do |format|
      if @places_user.save
        format.html { redirect_to @places_user, notice: 'Places user was successfully created.' }
        format.json { render :show, status: :created, location: @places_user }
      else
        format.html { render :new }
        format.json { render json: @places_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places_users/1
  # PATCH/PUT /places_users/1.json
  def update
    respond_to do |format|
      if @places_user.update(places_user_params)
        format.html { redirect_to @places_user, notice: 'Places user was successfully updated.' }
        format.json { render :show, status: :ok, location: @places_user }
      else
        format.html { render :edit }
        format.json { render json: @places_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places_users/1
  # DELETE /places_users/1.json
  def destroy
    @places_user.destroy
    respond_to do |format|
      format.html { redirect_to places_users_url, notice: 'Places user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_places_user
      @places_user = PlacesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def places_user_params
      params.require(:places_user).permit(:name, :display_name, :last_commented, :last_merged)
    end
end
