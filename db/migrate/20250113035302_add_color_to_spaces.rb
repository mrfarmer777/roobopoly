class AddColorToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :color, :string
  end
end
