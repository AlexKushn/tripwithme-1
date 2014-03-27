class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :phone_num

      t.belongs_to :user_trip

      t.timestamps
    end
  end
end
