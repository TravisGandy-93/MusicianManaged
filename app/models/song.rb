class Song < ApplicationRecord
  belongs_to :user 
  belongs_to :musician
  belongs_to :album
  

end
