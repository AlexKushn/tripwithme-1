class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :author, index: true
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
