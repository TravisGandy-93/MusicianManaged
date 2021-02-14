class Album < ApplicationRecord
  has_many :songs
  belongs_to :musician
  has_many :users, through: :songs
end
