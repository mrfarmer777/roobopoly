class AddPositionDataToPlayerGame < ActiveRecord::Migration[7.1]
  def change
    add_column :player_games, :position, :integer, default: 1
  end
end
