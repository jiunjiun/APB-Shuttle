class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string    :name
      t.integer   :kind
      t.boolean   :special, default: false
      t.string    :note
      t.datetime  :depart

      t.timestamps
    end
  end
end
