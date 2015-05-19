class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author
      t.integer :rating
      t.text :content
      t.references :product, index: true

      t.timestamps
    end
  end
end
