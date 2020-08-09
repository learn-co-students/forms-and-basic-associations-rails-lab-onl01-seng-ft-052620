class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes# add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    genre.songs << self
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def song_note=(array)
    array.each do |n|
      note = Note.find_or_create_by(content: n)
      self.notes << note
    end
  end
end
