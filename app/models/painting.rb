require 'pry'

class Painting

  attr_accessor :artist, :gallery
  attr_reader :title, :price

  @@all = []

  def initialize(title, price, artist, gallery)
    @title = title
    @price = price
    @artist = artist
    @gallery = gallery
    @@all << self
  end

  def self.all
    @@all
  end 

  def self.total_price
    self.all.map { |art| art.price}.sum
  end 
end
