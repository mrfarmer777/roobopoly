class AddPlayerGames < ActiveRecord::Migration[7.1]
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :result
      t.timestamps
    end
  end
end
