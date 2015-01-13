class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def admin_required
    login_required
    if current_user.nil?
      return
    end
    unless current_user.admin?
      store_target_location
      redirect_to login_url, :alert => "Access denied!"
    end
  end

  def login_required
    unless logged_in?
      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end
  def set_locale
    unless session[:locale]
      I18n.locale = 'no'
      session[:locale] = 'no'
    end
    I18n.locale = session[:locale]
    if params[:locale] =~/en|no/
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    end
  end

  private

  def store_target_location
    session[:return_to] = request.url
  end
end
