class Album < ActiveRecord::Base
  RECORDING_TYPES = %w(Live Studio)
  validates :title, :band_id, :recording_type, presence: true
  validates :title, uniqueness: true

  belongs_to(
    :band,
    :class_name => "Band",
    :foreign_key => :band_id,
    :primary_key => :id
  )

  has_many(
    :tracks,
    :dependent => :destroy,
    :class_name => "Track",
    :foreign_key => :album_id,
    :primary_key => :id
  )
end