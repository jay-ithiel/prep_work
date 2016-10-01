class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :owner_id, presence: true

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    shortened_url = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(short_url: shortened_url)
      shortened_url = SecureRandom.urlsafe_base64
    end
    shortened_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      :short_url => ShortenedUrl.random_code,
      :long_url => long_url,
      :owner_id => user.id
    )
  end

  def num_clicks
    Visit
      .select(:user_id)
      .where(short_url_id: self.id).count
  end

  def num_uniques
    Visit
      .select(:user_id)
      .where(short_url_id: self.id)
      .distinct.count
  end

  def num_recent_uniques
    Visit
      .select(:user_id)
      .where(short_url_id: self.id, updated_at: 10.minutes.ago)
      .distinct.count
  end
end
