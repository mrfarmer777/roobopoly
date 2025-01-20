class AddTypeToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :type, :string
  end
end
