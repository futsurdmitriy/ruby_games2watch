class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id]) if session [:user_id]
  end

  def require_login
    unless session[:user_id]
      flash[:errors] = ["You must have admin user rights to access this page"]
      redirect_to sign_in_path
    end
  end
end
