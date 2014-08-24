class IndexController < ApplicationController
  def index
    @bus = Bus.latest_depart.first
  end

  def next
    @bus = Bus.latest_depart.offset(params[:next]).first
  end
end
