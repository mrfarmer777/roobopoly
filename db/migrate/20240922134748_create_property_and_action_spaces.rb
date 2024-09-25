class CreatePropertyAndActionSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :spaces do |t|
      t.bigint :game_id, null: false
      t.integer :position, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
