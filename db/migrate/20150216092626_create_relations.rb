class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string  :kind
      t.string  :description
      t.string  :link

      t.timestamps null: false
    end
  end
end
