class ScheduledGame < ActiveRecord::Base
  belongs_to :home_team,
    primary_key: :id,
    foreign_key: :home_team_id,
    class_name: :Team

  belongs_to :away_team,
    primary_key: :id,
    foreign_key: :away_team_id,
    class_name: :Team
end
