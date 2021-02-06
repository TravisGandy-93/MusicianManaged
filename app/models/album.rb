class Album < ApplicationRecord
  belongs_to :musician
  has_many :songs
  has_many :users, through: :songs
end
