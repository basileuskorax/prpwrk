class Student
  attr_reader :courses, :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    return if courses.include?(course)
    raise "course would cause conflict!" if has_conflict?(course)

    self.courses << course
    course.students << self
  end

  def has_conflict?(other_course)
    self.courses.any? {|this_course| other_course.conflicts_with?(this_course)}
  end

  def course_load
    c_l = Hash.new(0)
    self.courses.each{|course| c_l[course.department] += course.credits}
    c_l
  end

end



# ## And some extras:
# * Update `Student#enroll` so that you raise an error if a `Student`
#   enrolls in a new course that conflicts with an existing course time.
#     * May want to write a `Student#has_conflict?` method to help.

#   def enroll(course)
#   raise "course would cause conflict!" if has_conflict?(course)
#
#   def has_conflict?(new_course)
#     self.courses.any? do |enrolled_course|
#       new_course.conflicts_with?(enrolled_course)
#     end
#   end
# end
