class Stadium < ActiveRecord::Base
  belongs_to :team,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: :Team

  has_many :seats,
    primary_key: :id,
    foreign_key: :stadium_id,
    class_name: :Seat

  has_many :games,
    through: :team,
    source: :home_games
end
