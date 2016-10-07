class Track < ActiveRecord::Base
  validates :name, :album_id, :track_type, presence: true

  belongs_to :album

  def track_type_bonus?
    self.track_type == "Bonus"
  end
end
