class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :admin?, :username

  def current_user
    session[:user_id] ||= nil
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      redirect_to '/'
    end
  end

  def admin?
    @user = User.find(current_user)
    @user.admin
  end

  def username
    User.find(current_user).name
  end

end
