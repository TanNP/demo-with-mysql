class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :img, :text
  end
end
