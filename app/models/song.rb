class Song < ApplicationRecord
  belongs_to :user 
  belongs_to :musician
  belongs_to :album
  has_one :genre
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :genre, allow_destroy: true
  validates :title, presence: true
  validate :not_a_duplicate

  def genre
    @genre 
  end
  
  def not_a_duplicate
    song = Song.find_by(title: title, album_id: album_id)
    if !!song && song != self
      errors.add(:title, 'has already been added to that album')
    end
  end
end
