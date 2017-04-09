class User < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  has_many :chats
  has_many :messages

  before_create :generate_username

  def location
    [latitude, longitude]
  end

  private
  def generate_username
    num = rand(6)

    case num
    when 0
      self.username = Faker::StarWars.character
    when 1
      self.username = Faker::GameOfThrones.character
    when 2
      self.username = Faker::Superhero.name
    when 3
      self.username = Faker::HarryPotter.character
    when 4
      self.username = Faker::Ancient.god
    when 5
      self.username = Faker::Friends.character
    end
  end
end
