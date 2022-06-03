require 'pry'

require_relative "artist.rb"
require_relative "painting.rb"

class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end 

  def paintings
    Painting.all.select { |paint| paint.gallery == self } 
  end 


  def artists
    paintings.collect { |paint| paint.artist }
  end

  def artist_names
    artists.collect { |art| art.name }
  end 

  def most_expensive_painting
    maxi = paintings.collect {|paint| paint.price}.max
    paintings.select { |paint| paint.price == maxi}
  end 
end
