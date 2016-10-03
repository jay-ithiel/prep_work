class Seat < ActiveRecord::Base
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Fan

  belongs_to :stadium,
    primary_key: :id,
    foreign_key: :stadium_id,
    class_name: :Stadium
end
