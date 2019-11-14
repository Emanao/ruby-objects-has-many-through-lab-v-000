class Genre
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name=name
    self.save
  end
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all<<self
  end
  def add_song(song)
    raise AssociationTypeMismatchError,"#{song.class} received, Song expected." if !song.is_a?(Song)
    song.genre=self
  end
  def songs
    Song.all.select{|song| song.genre==self}
  end
  def artists
    songs.collect{|song| song.artist}
  end
end
