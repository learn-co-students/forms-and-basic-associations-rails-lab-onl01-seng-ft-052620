class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     self.genre ? self.genre.name : nil
  end


  # def note=(ids)
  #   ids.each do |id|
  #     note = Note.find(id)
  #     self.notes << note
  #   end
  # end

  def note=(info)
    info.each do |text|
      if text.strip != ""
         self.notes.build(content: text)
      end
    end
  end


end
