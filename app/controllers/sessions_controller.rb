class SessionsController < ApplicationController
  def new
    redirect_to users_path if current_user
  end
end
