puts "Привіт, Максим Гевик"

class Worker
  public def initialize(name, age, salary)
    @name = name
    @age = age
    @salary = salary
  end

  public def setName(name)
    @name = name
  end

  public def getName
    @name
  end

  public def setAge(age)
    @age = age
  end

  public def getAge
    @age
  end

  public def setSalary(salary)
    @salary = salary
  end

  public def getSalary
    @salary
  end
end

ivan = Worker.new("Іван", 25, 1000)
vasya = Worker.new("Вася", 26, 2000)

total_salary = ivan.getSalary + vasya.getSalary
puts "Сума зарплат Івана і Васі: #{total_salary}"

total_age = ivan.getAge + vasya.getAge
puts "Сума віку Івана і Васі: #{total_age}"