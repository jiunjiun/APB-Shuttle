class Bus < ActiveRecord::Base
  has_one :bus_cache
  accepts_nested_attributes_for :bus_cache

  enum category: [ :master, :safety, :security, :orange ]

  default_scope { order(:depart) }

  def self.departs_number(number=0)
    base_number = BusCache.where(bus: recent_depart).first.id
    bs_count    = BusCache.count
    number     += base_number
    number      = number % bs_count if bs_count < number
    number      = bs_count if number == 0
    BusCache.find(number).bus
  end

  def self.recent_depart
    rd = where("depart > ?", Time.current.change(year: 2014, month: 6, day:1)).first
    if rd.nil?
      first_bus
    else
      rd
    end
  end

  def self.reset_cache
    BusCache.destroy_all
    Bus.all.each do |bus|
      BusCache.new({bus: bus}).save
    end
  end

  def self.first_bus
    BusCache.first.bus
  end

  def save_with_orange
    self.kind = 4
    save
  end

  before_save :add_depart
  private
    def add_depart
      self.depart = self.depart.change(year: 2014, month: 6, day: 1)
    end
end
