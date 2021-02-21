class Album < ApplicationRecord
  has_many :songs, :dependent => :destroy
  belongs_to :musician
  validates :name, presence: true

  scope :recent, -> { order(:created_at, :desc) }

  
 
end
