class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :title,presence:true

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil
  end

  def notes_content=(notes_content)
    notes_content.each do |note|
      self.notes.build(content: note) if note != ""
    end
  end

end
