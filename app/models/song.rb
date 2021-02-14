class Song < ApplicationRecord
  belongs_to :user # Creator of it
  belongs_to :album
  belongs_to :musician
  accepts_nested_attributes_for :musician
  

  def musician_attributes=(attributes)
    self.musician = Musician.find_or_create_by(attributes) if !attributes['name'].empty?
    self.musician
  end

  def album_attributes=(attributes)
    self.album = Album.find_or_create_by(attributes) if !attributes['name'].empty?
    self.album 

  end
end
