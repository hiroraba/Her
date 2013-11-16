class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :signed_in_user, only: [:edit, :update]

  def index
    render 'shared/no_contents.html.erb'
  end

  def show
    render 'shared/no_contents.html.erb'
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to yourtodo_path
      flash[:success] = "Welcome to todo list webapp!"
    else
      render 'new'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end
