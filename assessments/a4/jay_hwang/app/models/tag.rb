class Tag < ActiveRecord::Base
  validates :post, :name, presence: true
  belongs_to :post
end
