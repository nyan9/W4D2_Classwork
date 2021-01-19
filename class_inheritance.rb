class Employee
  attr_reader :boss, :name, :salary
  def initialize(name, title, salary, boss= nil)
    @boss = boss
    @name = name
    @title = title
    @salary = salary
    
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee

  attr_accessor :employees
  def initialize(name, title, salary, boss= nil)
    super(name, title, salary, boss)
    @employees = []
  end
  
  def add_employee(instances)
    instances.each do |instance|
      if instance.boss == self.name
        self.employees << instance
      end
    end
  end

  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        employee.employees.each { |employee2| sum += employee2.salary }
        sum += employee.salary
      else
        sum += employee.salary
      end
    end
    bonus = sum * multiplier
  end

  # def inspect
  #   "#{@name}, #{@title}, #{@salary}, #{@boss} #{employees}"
  # end
end

instances = [
 shawna= Employee.new("Shawna", "TA", 12000, "Darren"), 
 david= Employee.new("David", "TA", 10000, "Darren"), 
 darren= Manager.new("Darren", "TA Manager", 78000, "Ned"),
 ned= Manager.new("Ned", "Founder", 1000000)
]

darren.add_employee(instances)
darren.bonus(4)
david.bonus(3)
 ned.add_employee(instances)
p ned
p ned.bonus(5)
