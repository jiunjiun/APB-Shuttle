class Bus < ActiveRecord::Base
  enum category: [ :master, :safety, :security ]

  def self.latest_depart
    latest_depart = where("depart > ?", Time.zone.now.change(year: 2014, month: 6, day:1)).order(:depart)
    order(:depart) if latest_depart.size <= 0
  end

  before_save :update_depart
  private
    def update_depart
      self.depart = self.depart.change(year: 2014, month: 6, day: 1)
    end
end
