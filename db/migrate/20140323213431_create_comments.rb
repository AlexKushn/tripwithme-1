class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author, index: true
      t.belongs_to :trip, index: true
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
