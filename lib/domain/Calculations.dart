import 'package:calculations/domain/operation.dart';

class Calculations {
  static Operation startSum() {
    return Summary();
  }

  static Operation startSub() {
    return Substract();
  }

  static Operation startMult() {
    return Multiply();
  }

  static Operation startDiv() {
    return Division();
  }

  static List<Operation> getOperations() {
    return [
      Summary(),
      Substract(),
      Multiply(),
      Division(),
    ];
  }
}
