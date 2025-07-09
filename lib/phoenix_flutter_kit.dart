
import 'phoenix_flutter_kit_platform_interface.dart';

class PhoenixFlutterKit {
  Future<String?> getPlatformVersion() {
    return PhoenixFlutterKitPlatform.instance.getPlatformVersion();
  }
}
