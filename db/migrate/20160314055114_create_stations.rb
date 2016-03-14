class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lon, precision: 9, scale: 6

      t.timestamps null: false
    end
  end
end
