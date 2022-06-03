require 'pry'

require_relative "painting.rb"
require_relative "gallery.rb"

class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings 
    Painting.all.select { |paint| paint.artist == self }
  end

  def galleries
    paintings.collect{ |paint| paint.gallery }
  end

  def cities 
    galleries.collect {|paint| paint.city} 
  end

  def self.total_experience
    Artist.all.map { |art| art.years_experience}.sum
  end 

  def create_painting(title, price, gallery)
     Painting.new(title, price, self, gallery)
  end 

  def score 
    paintings.count.to_f / years_experience
  end

  def self.most_prolific
    Artist.all.max do |artist1, artist2| 
    artist1.score <=> artist2.score 
    end  
  end 
end
