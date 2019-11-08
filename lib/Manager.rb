class Manager 

  attr_accessor :name, :department, :age

  @@all = []

  def initialize(name, department, age)
    @name = name
    @department = department
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def employees
    Employee.all.select do |employee|
      employee.manager_name == self
    end
  end

  def hire_employee(name, salary)
    Employee.new(name, salary, self)
  end

  def self.all_departments
    self.all.map do |manager|
      manager.department
    end.uniq
  end

  def self.average_age
    self.all.map do |manager|
      manager.age
    end.sum/self.all.length
  end
  
end
