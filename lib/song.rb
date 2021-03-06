class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist = artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song = (filename.sub /[.]+?\S+\Z/, "").split(" - ")
    new_song = self.new(song[1])
    new_song.artist_name = song[0]
    new_song
  end

end
