class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def note_names=(array)
    array.each do |v|
      note = Note.find_or_create_by(content: v)
      self.notes << note
    end
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    artist.songs << self
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
end
