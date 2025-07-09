import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'phoenix_flutter_kit_method_channel.dart';

abstract class PhoenixFlutterKitPlatform extends PlatformInterface {
  /// Constructs a PhoenixFlutterKitPlatform.
  PhoenixFlutterKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static PhoenixFlutterKitPlatform _instance = MethodChannelPhoenixFlutterKit();

  /// The default instance of [PhoenixFlutterKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelPhoenixFlutterKit].
  static PhoenixFlutterKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PhoenixFlutterKitPlatform] when
  /// they register themselves.
  static set instance(PhoenixFlutterKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
