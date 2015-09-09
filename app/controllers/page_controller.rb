class PageController < ApplicationController
  def apb
    @apb_img = Photo.first
  end

  def orange
    @ref_link = Relation.find_by_kind('orange_ref')
    @bus_img  = Relation.find_by_kind('orange_bus_img')
  end

  def about
  end

  def doc
  end

  def announce
  end
end
