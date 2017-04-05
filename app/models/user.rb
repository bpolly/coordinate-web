class User < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  has_many :chats
  has_many :messages
end
