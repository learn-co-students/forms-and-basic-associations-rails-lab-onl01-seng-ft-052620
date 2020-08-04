class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
    # binding.pry
    content.each do |c|
      if c != ""
        note = Note.create(content: c) 
        self.notes << note
      end
    end
    
  end

  def note_contents
    
  end


end
