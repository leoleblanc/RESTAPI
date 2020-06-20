class User < ApplicationRecord
  has_many :tools

  has_many :markets
  has_many :apps, through: :markets
end
