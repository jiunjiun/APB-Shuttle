class ApiController < ApplicationController
  def now
    @bus = Bus.recent_depart

    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def next
    @bus = Bus.departs_number(params[:next].to_i)

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

  def all_apb
    @buses = Bus.where(kind: [1, 2, 3]).limit(params[:limit])
    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def all_orange
    @buses = Bus.where(kind: 4).limit(params[:limit])
    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def info
    @apb_img = Photo.first
    @ref_link = Relation.find_by_kind('orange_ref')
    @bus_img  = Relation.find_by_kind('orange_bus_img')

    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end

  def doc
    render layout: 'doc'
  end

  def error
    respond_to do |format|
      format.html { redirect_to api_doc_path}
      format.json
    end
  end
end
