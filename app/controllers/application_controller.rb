class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :set_cache_buster
  helper_method :current_user
  helper_method :require_login
  helper_method :require_admin
  helper_method :require_moderator
  helper_method :give_rating
  helper_method :current_admin


  def give_rating
    agent = Mechanize.new
    page = agent.get(new_rating_url)
    test_form = page.form('form')
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin = current_user && current_user.user_profile == 'admin'
  end

  def require_login
    unless current_user
      redirect_to home_url, notice: 'You must be logged in to access this page'
    end
  end

  def require_admin
    unless current_user && current_user.user_profile.to_s == 'admin'
      redirect_to home_url, notice: 'You are not authorized to access this page'
    end
  end

  def require_moderator
    unless current_user && current_user.user_profile.to_s == 'moderator'
      redirect_to home_url, notice: 'You are not authorized to access this page'
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
