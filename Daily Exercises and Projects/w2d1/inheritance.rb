class Employee
  attr_accessor :name, :title, :salary, :boss, :subordinates

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @subordinates = nil
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(*args)
    @subordinates = []
    super
  end

  def bonus(multiplier)
    result = recursive_salary_finder(subordinates)
    result * multiplier
  end

  def recursive_salary_finder(subordinates)
    result = 0
    return result if subordinates == nil
    subordinates.each do |subordinate|
      result += subordinate.salary
      result += recursive_salary_finder(subordinate.subordinates)
    end
    result
  end


end

ned = Manager.new("ned", "Founder",1000000,nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.subordinates = [shawna, david]
ned.subordinates = [darren]
puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
