class RemoveToolsColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :tools
  end
end
