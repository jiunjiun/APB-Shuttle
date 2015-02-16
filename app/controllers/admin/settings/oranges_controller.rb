class Admin::Settings::OrangesController < AdminController
  before_action :set_relation, only: [:edit, :update]
  def index
    @relations = Relation.all
  end

  def edit
  end

  def update
    if @relation.update(relation_params)
      redirect_to admin_settings_oranges_path
    else
      render :edit
    end
  end

  private
    def set_relation
      @relation = Relation.find(params[:id])
    end

    def relation_params
      params.require(:relation).permit(:description, :link)
    end
end
