class IndexController < ApplicationController
  def index
    @bus = @recent_depart = Bus.recent_depart
  end

  def next
    @bus           = Bus.departs_number(params[:next].to_i)
    @recent_depart = Bus.recent_depart
    redirect_to root_url if @bus.blank?
  end
end
