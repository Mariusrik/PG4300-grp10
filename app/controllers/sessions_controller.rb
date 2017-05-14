class SessionsController < ApplicationController
  skip_before_action :require_login, :only=>[:new,:create]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password_digest])
    if user
      session[:user_id] = user.id
      redirect_to home_path, :notice => "Logged in!"
    else
      redirect_to log_in_path, :alert => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, :notice => "Logged out!"
  end

end
