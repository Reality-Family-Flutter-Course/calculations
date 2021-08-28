abstract class Operation {
  String shortName();
  double? operation(double? num1, double? num2);
}

class Summary implements Operation {
  @override
  String shortName() => "+";

  @override
  double operation(double? num1, double? num2) {
    return (num1 ?? 0) + (num2 ?? 0);
  }

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  @override
  int get hashCode => shortName().hashCode;
}

class Substract implements Operation {
  @override
  String shortName() => "-";
  @override
  double operation(double? num1, double? num2) {
    return (num1 ?? 0) - (num2 ?? 0);
  }

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  @override
  int get hashCode => shortName().hashCode;
}

class Multiply implements Operation {
  @override
  String shortName() => "*";
  @override
  double operation(double? num1, double? num2) {
    if (num1 == null && num2 == null) {
      return 0;
    } else {
      return (num1 ?? 1) * (num2 ?? 1);
    }
  }

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  @override
  int get hashCode => shortName().hashCode;
}

class Division implements Operation {
  @override
  String shortName() => "/";
  @override
  double? operation(double? num1, double? num2) {
    if (num2 == 0 || num2 == null) {
      return null;
    } else if (num1 == null) {
      return 0;
    } else {
      return num1 / num2;
    }
  }

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();
  @override
  int get hashCode => shortName().hashCode;
}
