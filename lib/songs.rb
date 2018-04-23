class Song
  attr_accessor: name, artist, genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
