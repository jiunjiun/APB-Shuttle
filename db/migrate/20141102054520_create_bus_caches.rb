class CreateBusCaches < ActiveRecord::Migration
  def change
    create_table :bus_caches do |t|
      t.references :bus, index: true

      t.timestamps
    end
  end
end
