# create_table "users", force: :cascade do |t|
#   t.string   "email",      null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :short_urls,
      primary_key: :id,
      foreign_key: :owner_id,
      class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
    through: :visits,
    source: :short_url
end
