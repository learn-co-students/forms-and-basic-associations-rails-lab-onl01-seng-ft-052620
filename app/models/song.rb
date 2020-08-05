class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_content=(notes_content)
     notes_content.each do |content|
        self.notes << Note.find_or_create_by(content: content) if content != ""
     end
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  


 



end
