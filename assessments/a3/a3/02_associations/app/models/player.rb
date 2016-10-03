class Player < ActiveRecord::Base
  has_many :follows,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: :Follow

  has_many :jerseys,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: :Jersey

  belongs_to :team,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: :Team

  has_many :followers,
    through: :follows,
    source: :fan

  has_one :captain,
    through: :team,
    source: :captain

end
