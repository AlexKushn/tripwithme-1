class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start
      t.string :stop
      t.datetime :start_time
      t.float :price
      t.integer :passengers
      t.text :description
      t.integer :rating
      t.timestamps
    end

    create_table :trips_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :trip
    end
  end
end
