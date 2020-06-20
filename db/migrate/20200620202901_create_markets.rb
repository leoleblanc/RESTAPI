class CreateMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.belongs_to :user
      t.belongs_to :app
      t.timestamps
    end
  end
end
