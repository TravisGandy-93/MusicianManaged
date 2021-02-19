class Album < ApplicationRecord
  has_many :songs, :dependent => :destroy
  belongs_to :musician
  validates :name, presence: true
 
end
