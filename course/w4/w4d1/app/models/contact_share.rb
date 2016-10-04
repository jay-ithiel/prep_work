class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }

  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact,
    dependent: :destroy

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy
end
