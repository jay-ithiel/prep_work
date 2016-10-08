class User < ActiveRecord::Base
  validates :username,
    :session_token,
    presence: true,
    uniqueness: true

  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :posts
  has_many :authored_comments,
    foreign_key: :author_id,
    class_name: :Comment

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def self.gen_session_token
    SecureRandom.urlsafe_base64
  end

  attr_reader :password

  def ensure_session_token
    self.session_token ||= User.gen_session_token
  end

  def reset_session_token!
    self.session_token = User.gen_session_token
    self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(self.password_digest)
    bcrypt_obj.is_password?(password)
  end
end
