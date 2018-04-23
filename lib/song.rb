require 'pry'

class Song
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil))
    @name = name
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

  def save
    Song.all << self
  end
end
