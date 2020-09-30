class UsersController < ApplicationController
  before_action :require_login, only: [:index, :create, :show, :destroy]
  def index
    @users = User.all
  end

  def sign_up
    @new_user = User.new
  end

  def sign_in
  end

  def create
    @new_user = User.new(user_params)
    @new_user.role = "user" unless params[:user][:role]
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to "/admin/users"
    else
      flash[:errors] = @new_user.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      redirect_to "/admin/users"
    end
  end

  def edit
    if params[:id]
      @user_to_edit = User.find(params[:id])
    else
      redirect_to "/admin/users"
    end
  end

  def update
    if params[:id]
      @user_to_edit = User.find(params[:id])
      if @user_to_edit.update(user_params)
        redirect_to "/admin/users"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      user = User.find(params[:id])
      user.destroy
      redirect_to '/admin/users'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation, :role)
  end
end
