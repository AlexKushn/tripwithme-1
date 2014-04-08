class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.belongs_to :driver, index: true
      t.string :name
      t.integer :sits
      # image url can be add later
      t.timestamps
    end
  end
end
