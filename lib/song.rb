require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name).tap {|x| x.save}
    song
  end

  def save
    Song.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self  if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    Artist.find_or_create_by_name(file[0])
    Song.find_by_name(file[1]) || Song.new(file[1])
    Genre.find_or_create_by_name(file[2])
    binding.pry
  end
end

Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
