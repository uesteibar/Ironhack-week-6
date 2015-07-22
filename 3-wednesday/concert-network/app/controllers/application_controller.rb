class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if @current_user.nil?
      @current_user = User.find_by_id(session[:user_id])
    end
    @current_user
  end

  def authorize_user
    unless current_user
      flash[:warning] = "Please log in to access this page."
      redirect_to "/"
    end
  end

  def admin_only
    unless current_user && current_user.role == "admin"
      flash[:danger] = "You need to be an admin to go there."
      redirect_to "/"
    end
  end
end
