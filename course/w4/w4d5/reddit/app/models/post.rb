class Post < ActiveRecord::Base

validates :title, :author_id, :subs, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :comments, dependent: :destroy
  has_many :subs, through: :post_subs
end
