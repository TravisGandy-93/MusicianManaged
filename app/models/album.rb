class Album < ApplicationRecord
  has_many :songs, :dependent => :destroy
  has_many :genres
  belongs_to :musician
  validates :name, presence: true

  scope :recent, -> { order(:created_at, :desc) }

  
 
end
