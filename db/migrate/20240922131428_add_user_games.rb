class AddUserGames < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :result
      t.timestamps
    end
  end
end
