class Todo < ActiveRecord::Base
  validates :title, :body, :done, presence: true
end
