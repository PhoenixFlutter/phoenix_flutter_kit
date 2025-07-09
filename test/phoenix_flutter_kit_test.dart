import 'package:flutter_test/flutter_test.dart';
import 'package:phoenix_flutter_kit/phoenix_flutter_kit.dart';
import 'package:phoenix_flutter_kit/phoenix_flutter_kit_platform_interface.dart';
import 'package:phoenix_flutter_kit/phoenix_flutter_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPhoenixFlutterKitPlatform
    with MockPlatformInterfaceMixin
    implements PhoenixFlutterKitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PhoenixFlutterKitPlatform initialPlatform = PhoenixFlutterKitPlatform.instance;

  test('$MethodChannelPhoenixFlutterKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPhoenixFlutterKit>());
  });

  test('getPlatformVersion', () async {
    PhoenixFlutterKit phoenixFlutterKitPlugin = PhoenixFlutterKit();
    MockPhoenixFlutterKitPlatform fakePlatform = MockPhoenixFlutterKitPlatform();
    PhoenixFlutterKitPlatform.instance = fakePlatform;

    expect(await phoenixFlutterKitPlugin.getPlatformVersion(), '42');
  });
}
