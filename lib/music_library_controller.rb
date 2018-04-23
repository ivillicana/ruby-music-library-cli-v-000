class MusicLibraryController

  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    option = gets.strip
    call if option != "exit"
  end

  def list_songs
    count = 1
    Song.all.sort_by {|x| x.name}.each {|f| puts "1. #{f.artist.name} - #{f.name} - #{f.genre.name}" count += 1}
  end
end
