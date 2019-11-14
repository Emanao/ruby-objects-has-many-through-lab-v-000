class Artist
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
    song.artist=self
  end
  def songs
    Song.all.select{|song| song.artist==self}
  end
  def genres
    songs.collect{|song| song.genre}
  end
end
