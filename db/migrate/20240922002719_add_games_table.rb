class AddGamesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :turn, default: 1
      t.integer :player_id
      t.integer :opponent_id
      t.string :status
      t.string :result

      t.timestamps
    end
  end
end
