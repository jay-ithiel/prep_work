class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def self.gen_session_token
    SecureRandom.urlsafe_base64
  end

  attr_reader :password

  def reset_session_token!
    self.session_token = User.gen_session_token
    self.save
  end

  def ensure_session_token
    self.session_token ||= User.gen_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    verify_me = BCrypt::Password.new(self.password_digest)
    verify_me.is_password?(password)
  end
end
