class Genre < ApplicationRecord
    belongs_to :song
    belongs_to :album
end
