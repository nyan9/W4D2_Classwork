class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee

  attr_writer :employees
  def initialize
    @employees = []
  end
end