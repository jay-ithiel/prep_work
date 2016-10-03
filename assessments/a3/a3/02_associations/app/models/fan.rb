class Fan < ActiveRecord::Base
  has_many :follows,
    primary_key: :id,
    foreign_key: :fan_id,
    class_name: :Follow

  has_many :seats,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Seat

  has_many :followed_players,
    through: :follows,
    source: :player

  belongs_to :favorite_team,
    primary_key: :id,
    foreign_key: :favorite_team_id,
    class_name: :Team
end
