class Musician < ApplicationRecord
    has_many :albums
    has_many :songs
    has_many :users, through: :songs
    validates :name, presence: true, uniqueness: true
   
end
