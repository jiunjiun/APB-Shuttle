class Admin::OrangesController < AdminController
  before_action :set_bus, only: [:edit, :update, :destroy]

  def index
    @buses = Bus.where(kind: 4).all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save_with_orange
      redirect_to admin_oranges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bus.update(bus_params)
      redirect_to admin_oranges_path
    else
      render :edit
    end
  end

  def destroy
    @bus.destroy
    redirect_to admin_oranges_path
  end

  private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:name, :note, :depart)
    end
end
