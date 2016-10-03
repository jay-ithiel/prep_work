class User < ActiveRecord::Base
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Enrollment

  has_many :courses,
    through: :enrollments,
    source: :Course
end
