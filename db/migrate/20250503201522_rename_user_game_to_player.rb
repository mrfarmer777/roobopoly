class RenameUserGameToPlayer < ActiveRecord::Migration[7.1]
  def change
    rename_table :players, :players
  end
end
