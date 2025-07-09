import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AssetLoader {

  /// Read the contents of a text file in the assets directory
  ///  [filePath] Relative path to the file, e.g., 'assets/config.json'.
  static Future<String> loadTextAsset(String filePath) async {
    try {
      final content = await rootBundle.loadString(filePath);
      return content;
    } catch (e) {
      throw Exception('Unable to load text file: $filePath');
    }
  }

  /// Reads the JSON file in the assets directory and parses it into a Map.
  ///  [filePath] Relative path to the file, e.g. 'assets/config.json'.
  static Future<Map<String, dynamic>> loadJsonAsset(String filePath) async {
    try {
      final String jsonString = await loadTextAsset(filePath);
      final jsonMap =
      await compute(jsonDecode, jsonString) as Map<String, dynamic>;
      // final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return jsonMap;
    } catch (e) {
      throw Exception('Unable to parse JSON file: $filePath');
    }
  }

  /// Retrieve the contents of a binary file in the assets directory
  ///  [filePath] relative path to the file, e.g. 'assets/image.png'
  static Future<ByteData> loadBinaryAsset(String filePath) async {
    try {
      final ByteData data = await rootBundle.load(filePath);
      return data;
    } catch (e) {
      throw Exception('Unable to load binary file: $filePath');
    }
  }


// static Future<String> loadTextAssetWithContext(BuildContext context, String filePath) async {
//   try {
//     final String content = await DefaultAssetBundle.of(context).loadString(filePath);
//     return content;
//   } catch (e) {
//     throw Exception('Unable to load text file: $filePath');
//   }
// }
}