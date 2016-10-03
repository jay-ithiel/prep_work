class Jersey < ActiveRecord::Base
  belongs_to :player,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: :Player
end
