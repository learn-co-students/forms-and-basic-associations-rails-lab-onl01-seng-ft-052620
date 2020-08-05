class Song < ActiveRecord::Base
  # add associations here
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

  def notes=(notes)
    notes.each do |note| 
      if !note.empty?
        song_note = Note.create(content: note)
        self.notes << song_note
      end 
    end 
  end 

  # def post_ids=(ids)
#      ids.each do |id|
#        post = Post.find(id)
#        self.posts << post
#      end
#   end

end
