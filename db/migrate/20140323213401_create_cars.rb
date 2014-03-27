class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :sits
      # image url can be add later
      t.belongs_to :user

      t.timestamps
    end
  end
end
