class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start
      t.string :stop
      t.datetime :start_time
      t.integer :price
      t.integer :passengers
      t.text :description

      t.belongs_to :user_trip

      t.timestamps
    end
  end
end
