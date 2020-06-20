class App < ApplicationRecord
  has_many :markets
  has_many :users, through: :markets
end
