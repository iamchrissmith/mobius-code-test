class SessionsController < ApplicationController
  def new
    redirect_to users_path if current_user
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
