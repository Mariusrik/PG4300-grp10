class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  include ActiveModel::AttributeAssignment
  helper_method :current_user
  helper_method :require_login
  helper_method :require_admin
  helper_method :require_moderator
  helper_method :current_admin
  helper_method :get_categories

  private

  def get_categories
    @categories = Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound => e
    @current_user = nil
  end

  def current_admin
    @current_admin = current_user && current_user.user_profile == 'admin'
  rescue ActiveRecord::RecordNotFound => e
    @current_admin = nil
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


end
