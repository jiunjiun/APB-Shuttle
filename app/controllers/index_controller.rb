class IndexController < ApplicationController
  def index
    @bus   = Bus.latest_depart.first
  end
end
