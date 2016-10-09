class Link < ActiveRecord::Base
  validates :title, :user, :url, presence: true

  belongs_to :user
  has_many :comments
end
