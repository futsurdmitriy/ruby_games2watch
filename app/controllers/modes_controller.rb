class ModesController < ApplicationController
  def index
    @modes = Mode.all
  end

  def new
    @new_mode = Mode.new
  end

  def create
    @new_mode = Mode.new(mode_params)
    if @new_mode.save
      redirect_to "/admin/modes"
    else
      flash[:errors] = @new_mode.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @mode = Mode.find(params[:id])
    else
      redirect_to "/admin/modes"
    end
  end

  def edit
    if params[:id]
      @mode_to_edit = Mode.find(params[:id])
    else
      redirect_to "/admin/modes"
    end
  end

  def update
    if params[:id]
      @mode_to_edit = Mode.find(params[:id])
      if @mode_to_edit.update(mode_params)
        redirect_to "/admin/modes"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      mode = Mode.find(params[:id])
      mode.destroy
      redirect_to '/admin/modes'
    end
  end

  private

  def mode_params
    params.require(:mode).permit(:name, :maximum_players)
  end
end
