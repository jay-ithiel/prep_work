class User < ApplicationRecord
  validates :name, :session_token, :password_digest, presence: true

  after_initialize :ensure_session_token

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
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
    self.password = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(self.password_digest)
    bcrypt_obj.is_password?(password)
  end
end
