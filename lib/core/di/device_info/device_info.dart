import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum PlatformName {
  android('Android');

  final String? value;

  const PlatformName(this.value);
}

class DeviceInfo {
  final String brand;
  final String model;
  final String osVersion;
  final String deviceName;
  final PlatformName platformName;
  final String appVersion;
  final String packageName;

  DeviceInfo({
    required this.brand,
    required this.model,
    required this.osVersion,
    required this.deviceName,
    required this.platformName,
    required this.appVersion,
    required this.packageName,
  });
}

@module
abstract class DeviceInfoModule {
  @singleton
  Future<DeviceInfo> provideDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    final androidInfo = await deviceInfoPlugin.androidInfo;

    return DeviceInfo(
      brand: androidInfo.manufacturer,
      model: androidInfo.model,
      osVersion: 'Android ${androidInfo.version.release}',
      deviceName: '${androidInfo.manufacturer} ${androidInfo.model}',
      platformName: PlatformName.android,
      appVersion: packageInfo.version.replaceAll('.dev', ''),
      packageName: packageInfo.packageName.replaceAll('.dev', ''),
    );
  }
}
