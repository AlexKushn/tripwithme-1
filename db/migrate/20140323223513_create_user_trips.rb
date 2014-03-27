class CreateUserTrips < ActiveRecord::Migration
  def change
    create_table :user_trips do |t|

      t.timestamps
    end
  end
end
