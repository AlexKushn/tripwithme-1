class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start
      t.string :stop
      t.datetime :start_time
      t.integer :price
      t.integer :passengers
      t.text :description
      t.timestamps
    end

    create_table :user_trips do |t|
      t.belongs_to :user
      t.belongs_to :trip
    end
  end
end
