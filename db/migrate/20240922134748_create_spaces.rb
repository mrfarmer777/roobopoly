class CreateSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :spaces do |t|
      t.bigint :game_id
      t.integer :position

      t.timestamps
    end
  end
end
