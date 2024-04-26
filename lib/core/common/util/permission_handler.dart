import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<void> cameraPermissionRequest() async {
    await Permission.camera.request();
  }

  static Future<bool> cameraPermissionCheck() async {
    var status = await Permission.camera.isGranted;
    return status;
  }
}
