class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :set_cache_buster
  helper_method :current_user
  helper_method :require_login
  helper_method :require_admin
  helper_method :require_moderator


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to home_url
    end
  end

  def require_admin
    unless current_user && current_user.user_profile.to_s == 'admin'
      redirect_to home_url
    end
  end

  def require_moderator
    unless current_user && current_user.user_profile.to_s == 'moderator'
      redirect_to home_url
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
