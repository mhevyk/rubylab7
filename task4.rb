class Worker
  public def initialize(name, age, salary)
    @name = name
    setAge(age)
    @salary = salary
  end

  public def setName(name)
    @name = name
  end

  public def getName
    @name
  end

  private def checkAge(age)
    age.between?(1, 100)
  end

  public def setAge(age)
    if checkAge(age)
      @age = age
    else
      raise "Вік #{age} не коректний. Вік повинен бути в межах від 1 до 100."
    end
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

ivan = Worker.new("Іван", 25, 1000) # Вік коректний
vasya = Worker.new("Вася", 200, 2000) # Вік некоректний

total_salary = ivan.getSalary + vasya.getSalary
puts "Сума зарплат Івана і Васі: #{total_salary}"

total_age = ivan.getAge + vasya.getAge
puts "Сума віку Івана і Васі: #{total_age}"