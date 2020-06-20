class AddToolsForUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
