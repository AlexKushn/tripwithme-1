class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :text

      t.belongs_to :user_trip

      t.timestamps
    end
  end
end
