class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token

  def self.gen_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(self.password_digest)
    bcrypt_obj.is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.gen_session_token
    self.save
  end

  def ensure_session_token
    self.session_token ||= User.gen_session_token
  end

end
