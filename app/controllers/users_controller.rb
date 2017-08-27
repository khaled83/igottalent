class UsersController < ApplicationController
  # before_action :authenticate_fb, except: [:home, :login_fb, :logged_in_fb, :logged_out_fb]

  def home
    @featured_video = Video.last
    Rails.logger.info "Users#home fb_user_id=#{session[:fb_user_id]} : @current_user=#{@current_user} : current_user=#{current_user}"
    if current_user
      redirect_to slots_path and return
    end
  end

  def sign_up
  end

  def login_fb
    redirect_to "https://www.facebook.com/dialog/oauth?client_id=1812832325605603&redirect_uri=#{request.base_url}/slots"
  end

  def logged_out_fb
    nullify_current_user
    head 200
  end

  def logout_fb
    nullify_current_user
    redirect_to root_url
  end

  def toggle_admin
    session[:is_admin] = params[:is_admin]
    Rails.logger.info session[:is_admin]
    head 200
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select
    set_current_user(params[:user_id])
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :token)
    end
end
