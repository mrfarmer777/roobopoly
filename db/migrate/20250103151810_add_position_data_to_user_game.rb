class AddPositionDataToUserGame < ActiveRecord::Migration[7.1]
  def change
    add_column :user_games, :position, :integer, default: 1
  end
end
