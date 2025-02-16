class AddProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.integer :property_space_id, null: false
      t.integer :owner_id
      t.integer :price, null: false
      t.integer :base_rent, null: false

      t.timestamps
    end
  end
end
