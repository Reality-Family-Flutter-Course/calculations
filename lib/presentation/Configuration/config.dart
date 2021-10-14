import 'dart:io';

enum OS { Android, IOS, Another }

class Configuration {
  static OS getOperatingSystem() {
    if (Platform.isAndroid) {
      return OS.Android;
    } else if (Platform.isIOS) {
      return OS.IOS;
    } else {
      return OS.Another;
    }
  }
}
