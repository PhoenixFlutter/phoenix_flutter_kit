import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'phoenix_flutter_kit_platform_interface.dart';

/// An implementation of [PhoenixFlutterKitPlatform] that uses method channels.
class MethodChannelPhoenixFlutterKit extends PhoenixFlutterKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('phoenix_flutter_kit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
