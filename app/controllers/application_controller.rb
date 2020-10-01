class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless session[:user_id]
      flash[:errors] = ["You must be logged in to access this page"]
      redirect_to sign_in_path
    end
  end

  # def require_user_admin_rights
  #   check_user_right(User::ADMIN_ROLE)
  # end
  #
  # def require_user_editor_rights
  #   check_user_right("editor")
  # end

  def check_user_right(roles)
    has_access = false
    if session[:user_id]
      roles.each do |role|
        if current_user.role.eql? role
          has_access = true
        end
      end
      unless has_access
        flash[:errors] = ["You must have #{roles.map { |role| role }} user rights to access this page"]
        redirect_back fallback_location: root_path
      end
    else
      require_login
    end
  end

  def user_logged_in
    if session[:user_id]
      true
    else
      false
    end
  end
end
