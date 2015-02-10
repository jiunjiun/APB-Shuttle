class IndexController < ApplicationController
  def index
    @bus = Bus.recent_depart
  end

  def next
    @bus = Bus.departs_number(params[:next].to_i)
    redirect_to root_url if @bus.blank?
  end
end
