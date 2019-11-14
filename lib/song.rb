class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, genre, artist=nil)
    @name = name
    @genre = genre
    @artist = artist
    self.save
  end
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all<<self
  end
end
