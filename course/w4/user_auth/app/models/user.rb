class User < ApplicationRecord
  validates :name, :password_digest, presence: true
  
end
