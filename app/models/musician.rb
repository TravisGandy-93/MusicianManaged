class Musician < ApplicationRecord
    has_many :albums
    has_many :songs
end
