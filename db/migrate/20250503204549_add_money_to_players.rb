class AddMoneyToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :money, :integer, default: 1500
  end
end
