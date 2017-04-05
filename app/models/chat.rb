class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages
  reverse_geocoded_by :latitude, :longitude
end
