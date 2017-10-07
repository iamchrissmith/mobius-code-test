class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your Account has been created."
      redirect_to users_path
    else
      render :new
    end
  end

  private 
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def require_user
      redirect_to login_path unless current_user
    end


end