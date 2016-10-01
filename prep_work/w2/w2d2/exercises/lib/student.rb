class Student
  attr_reader :courses, :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    raise "course will conflict!" if has_conflict?(course)
    @courses << course unless @courses.include?(course)
    course.students << self
  end

  def course_load
    credits = {}
    self.courses.each do |course|
      if credits[course.department] == nil
        credits[course.department] = course.credits
      else
        credits[course.department] += course.credits
      end
    end
    credits
  end


    def has_conflict?(second_course)
      self.courses.any? do |course|
        course.conflicts_with?(second_course)
      end
    end

end
