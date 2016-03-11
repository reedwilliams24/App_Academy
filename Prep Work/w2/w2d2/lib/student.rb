class Student
  
  attr_reader :first_name, :last_name, :courses
  
  def initialize(first,last)
    @first_name = first
    @last_name = last
    @courses = []
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def enroll(course)
    return if courses.include?(course)
    raise "course would cause conflict!" if has_conflict?(course)
    self.courses << course unless self.courses.include?(course)
    course.students << self
  end
  
  def course_load 
    load = Hash.new(0)
    self.courses.each do |course|
      load[course.department] += course.credits
    end
    load
  end
  
  def has_conflict?(new_course)
    self.courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end
  
end