class Song < ApplicationRecord
  belongs_to :user
  belongs_to :album
  belongs_to :musician
  accepts_nested_attributes_for :musician
end
