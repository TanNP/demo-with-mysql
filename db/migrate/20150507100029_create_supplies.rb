class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :companyName
      t.string :contactname
      t.string :phone
      t.text :email
      t.text :address
      t.references :product, index: true

      t.timestamps
    end
  end
end
