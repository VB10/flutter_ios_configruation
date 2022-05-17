import 'package:pigeon/pigeon.dart';

class UserModel {
  final String? userName;
  final String? userPassword;
  UserModel({
    this.userName,
    this.userPassword,
  });
}

enum AppThemes { dark, light }

class AppThemesResult {
  String? errorMessage;
  AppThemes? state;
}

enum AppVersion { dev, beta, stagging }

class AppVersionResult {
  String? errorMessage;
  AppVersion? version;
}

class Version {
  final int? major;
  final int? minor;
  final int? patch;
  Version({
    this.major,
    this.minor,
    this.patch,
  });
}

@HostApi()
abstract class ConfigurationApi {
  AppThemesResult? fetchTheme();
  AppVersionResult fetchVersion();
  UserModel? fetchUser();

  void updateVersion(Version version);
  String? fetchCurrent();
}

class Configuration {
  final String? key;
  final String? endPoint;
  final int? counterValue;
  final String? userName;
  final String? userPassword;
  final AppThemes? appTheme;
  Configuration({
    this.key,
    this.endPoint,
    this.counterValue,
    this.userName,
    this.userPassword,
    this.appTheme,
  });
}
