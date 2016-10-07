class Album < ActiveRecord::Base
  validates :name, :band_id, :album_type, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def album_type_live?
    self.album_type == "Live"
  end
end
