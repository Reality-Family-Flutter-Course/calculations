import 'package:calculations/presentation/Configuration/config.dart';
import 'package:calculations/presentation/Factories/Factories.dart';

class UIController {
  static UIFactory? _factory;

  static UIFactory? getFabric() {
    if (_factory == null) {
      switch (Configuration.getOperatingSystem()) {
        case OS.Android:
          _factory = AndroidUI();
          break;
        case OS.IOS:
          _factory = IOSUI();
          break;
        case OS.Another:
          _factory = null;
          break;
      }
    }

    return _factory;
  }
}
