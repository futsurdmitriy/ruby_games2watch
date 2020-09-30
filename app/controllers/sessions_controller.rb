class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    reset_session
    redirect_to sign_in_path
  end
end