class Follow < ActiveRecord::Base
  belongs_to :player,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: :Player

  belongs_to :fan,
    primary_key: :id,
    foreign_key: :fan_id,
    class_name: :Fan
end
