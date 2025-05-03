class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :wins, default: 0
      t.integer :losses, default: 0

      t.timestamps
    end
  end
end
