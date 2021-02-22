class Genre < ApplicationRecord
    belongs_to :song
    belongs_to :album
    validates :name, presence: true
end
