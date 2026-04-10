//
//https://htwins.net/palindrome/  =>(le(v)el)

abstract class Department {
  double calculateSalary();
}

class HRDepartment implements Department {
  @override
  double calculateSalary() {
    return 1000;
  }
}

class TechnicalDepartment implements Department {
  TechnicalDepartment();

  @override
  double calculateSalary() {
    return 5000;
  }
}

abstract class BonusCalculator {
  double calculateWithBonus(double salary);
}

class PercentageBonusCalculator implements BonusCalculator {
  final double percentage;

  PercentageBonusCalculator(
    this.percentage,
  );

  @override
  double calculateWithBonus(double salary) {
    return salary + (salary * percentage);
  }
}

class Employee {
  final String name;
  final Department department;
  final BonusCalculator bonusCalculator;

  Employee(this.name, this.department, this.bonusCalculator);

  double getSalary() {
    return department.calculateSalary();
  }

  double getSalaryWithBonus() {
    return bonusCalculator.calculateWithBonus(getSalary());
  }
}

void main() {
  Department hrDept = HRDepartment();
  Department techDept = TechnicalDepartment();

  BonusCalculator bonus10 = PercentageBonusCalculator(
    0.01,
  );

  Employee alice = Employee("Alice", hrDept, bonus10);
  Employee bob = Employee("Bob", techDept, bonus10);

  print("${alice.name} Salary: ${alice.getSalary()}");
  print("${alice.name} Salary with Bonus: ${alice.getSalaryWithBonus()}");

  print("${bob.name} Salary: ${bob.getSalary()}");
  print("${bob.name} Salary with Bonus: ${bob.getSalaryWithBonus()}");
}
