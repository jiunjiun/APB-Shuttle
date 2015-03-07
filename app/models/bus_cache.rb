class BusCache < ActiveRecord::Base
  belongs_to :bus

  def self.reset_pk_sequence
    update_seq_sql = "ALTER TABLE bus_caches AUTO_INCREMENT = 1;"
    ActiveRecord::Base.connection.execute(update_seq_sql)
  end
end
