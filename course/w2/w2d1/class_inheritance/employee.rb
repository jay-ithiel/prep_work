class Employee
  attr_reader :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss =
     name,  title,  salary,  boss
     @employees = []
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss, employees = [])
    super name, title, salary, boss
    @employees = employees
  end

  def total_salaries
    total = 0
    @employees.each do |employee|
      if (employee.employees.empty?)
        total += employee.salary
      else
        total += employee.total_salaries
      end
    end
    total + salary
  end

  def bonus(multiplier)
    total_bonus = 0

    employees.each do |employee|
      if employee.employees.empty?
        total_bonus += (employee.salary * multiplier)
      else
        total_bonus += employee.total_salaries * multiplier
      end
    end

    total_bonus
  end

end

ned = Manager.new('Ned', "Founder", 1_000_000, nil)
darren = Manager.new('Darren', "TA Manager", 78_000, ned)
shawna = Employee.new('Shawna', 'TA', 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)
ned.employees << darren
darren.employees.push(shawna, david)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
