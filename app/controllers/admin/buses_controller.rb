class Admin::BusesController < AdminController
  before_action :set_bus, only: [:edit, :update, :destroy]

  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to admin_buses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bus.update(bus_params)
      redirect_to admin_buses_path
    else
      render :edit
    end
  end

  def destroy
    @bus.destroy
    redirect_to admin_buses_path
  end

  private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:name, :kind, :note, :depart)
    end
end
