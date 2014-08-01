class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many(
    :albums,
    :dependent => :destroy,
    :class_name => "Album",
    :foreign_key => :band_id,
    :primary_key => :id
  )

  has_many(
    :tracks,
    :dependent => :destroy,
    :through => :albums,
    :source => :tracks
  )
end