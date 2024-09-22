class AddGamesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :turn, default: 1
      t.string :status
      t.string :result

      t.timestamps
    end
  end
end
