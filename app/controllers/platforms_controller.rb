class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
  end

  def new
    @new_platform = Platform.new
  end

  def create
    @new_platform = Platform.new(platform_params)
    if @new_platform.save
      redirect_to "/admin/platforms"
    else
      flash[:errors] = @new_platform.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @platform = Platform.find(params[:id])
    else
      redirect_to "/admin/platforms"
    end
  end

  def edit
    if params[:id]
      @platform_to_edit = Platform.find(params[:id])
    else
      redirect_to "/admin/platforms"
    end
  end

  def update
    if params[:id]
      @platform_to_edit = Platform.find(params[:id])
      if @platform_to_edit.update(platform_params)
        redirect_to "/admin/platforms"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      platform = Platform.find(params[:id])
      platform.destroy
      redirect_to '/admin/platforms'
    end
  end

  private

  def platform_params
    params.require(:platform).permit(:name)
  end
end
