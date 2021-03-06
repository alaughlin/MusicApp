class Track < ActiveRecord::Base
  validates :album_id, :title, :track_number, :track_type, presence: true

  belongs_to(
    :album,
    :class_name => "Album",
    :foreign_key => :album_id,
    :primary_key => :id
  )

  has_many(
    :notes,
    :class_name => "Note",
    :foreign_key => :track_id,
    :primary_key => :id
  )
end