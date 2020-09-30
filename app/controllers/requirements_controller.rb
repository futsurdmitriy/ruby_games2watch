class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
  end

  def new
    @new_requirement = Requirement.new
  end

  def create
    @new_requirement = Requirement.new(requirement_params)
    if params[:requirement][:game]
      @new_requirement.game = Game.find(params[:requirement][:game])
    end
    if @new_requirement.save
      redirect_to "/admin/requirements"
    else
      flash[:errors] = @new_requirement.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id]
      @requirement = Requirement.find(params[:id])
    else
      redirect_to "/admin/requirements"
    end
  end

  def edit
    if params[:id]
      @requirement_to_edit = Requirement.find(params[:id])
    else
      redirect_to "/admin/requirements"
    end
  end

  def update
    if params[:id]
      @requirement_to_edit = Requirement.find(params[:id])
      require_to_edit_game = Integer(params[:requirement][:game])
      if @requirement_to_edit.update(requirement_params) &&
        @requirement_to_edit.update(game: Game.find(require_to_edit_game))
        redirect_to "/admin/requirements"
      else
        render :edit
      end
    end
  end

  def destroy
    if params[:id]
      requirement = Requirement.find(params[:id])
      requirement.destroy
      redirect_to '/admin/requirements'
    end
  end

  private

  def requirement_params
    params.require(:requirement).permit(:req_type, :operating_system,
                                     :ram, :cpu, :gpu, :free_space)
  end
end
