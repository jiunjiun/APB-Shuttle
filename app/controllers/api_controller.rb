class ApiController < ApplicationController
  def index
    @buses = Bus.all
    render json: @buses.to_json
  end
end
