class Sub < ActiveRecord::Base

  validates :title, :mod_id, presence: true

  belongs_to :moderator,
    foreign_key: :mod_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :sub

  has_many :posts, through: :post_subs

end
