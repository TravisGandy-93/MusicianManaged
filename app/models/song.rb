class Song < ApplicationRecord
  belongs_to :user 
  belongs_to :musician
  belongs_to :album
  accepts_nested_attributes_for :album

  

end
