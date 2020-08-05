class Genre < ActiveRecord::Base
  # add associations
  belongs_to :artist
  belongs_to :genre
  has_many :songs

end
