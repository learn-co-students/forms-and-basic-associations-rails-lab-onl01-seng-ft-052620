class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_ids=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.songs << song
    end
  end

end
