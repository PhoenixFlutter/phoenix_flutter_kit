import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:phoenix_flutter_kit/phoenix_flutter_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phoenix Flutter Kit Example'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final json = await AssetLoader.loadJsonAsset('assets/config.json');
                  print('load json: ${jsonEncode(json)}');
                },
                child: const Text('AssetLoader load json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
