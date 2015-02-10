class ApiController < ApplicationController
  def now
    @bus = Bus.recent_depart
    session[:depart] ||= @bus.depart

    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def next
    @bus = Bus.departs_number(session[:now_num] + params[:next].to_i)

    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def all
    @buses = Bus.limit(params[:limit])
    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def doc
    render layout: 'doc'
  end

  def error
  end
end
