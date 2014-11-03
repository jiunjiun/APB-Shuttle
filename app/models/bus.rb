class Bus < ActiveRecord::Base
  has_one :bus_cache
  accepts_nested_attributes_for :bus_cache

  enum category: [ :master, :safety, :security ]

  default_scope { order(:depart) }

  def self.departs_number(number=0)
    bs_count = BusCache.count
    number = number % bs_count if bs_count < number
    BusCache.find(number).bus
  end

  def self.recent_depart
    where("depart > ?", Time.current.change(year: 2014, month: 6, day:1)).first
  end

  def self.reset_cache
    BusCache.destroy_all
    Bus.all.each do |bus|
      BusCache.new({bus: bus}).save
    end
  end

  before_save :add_depart
  private
    def add_depart
      self.depart = self.depart.change(year: 2014, month: 6, day: 1)
    end
end
