class Course
  attr_reader :name, :department, :credits, :days, :time_block, :students

  def initialize(name, department, credits, days, time_block)
    @name, @department, @credits, @days, @time_block =
      name, department, credits, days, time_block
    @students = []
  end

  def add_student(student)
    student.enroll(self)
  end

  def conflicts_with?(course)
    return false unless self.time_block == course.time_block

    days.any? {|day| course.days.include?(day)}
  end

end
