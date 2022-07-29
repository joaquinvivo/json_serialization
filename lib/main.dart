import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_serialization/user_auto.dart';
// import 'package:json_serialization/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JSON Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: decodeJson,
              child: const Text('Decode Json'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: encodeJson,
              child: const Text('Encode Json'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> decodeJson() async {
    String userString = await rootBundle.loadString('assets/user.json');
    Map<String, dynamic> userMap = await json.decode(userString);
    // debugPrint('Hello ${userMap['name']}');
    // debugPrint('Your email address is ${userMap['email']}.'); // Manual approach

    User user = User.fromJson(userMap);
    debugPrint('Hello ${user.name}!');
    debugPrint('Your email address is ${user.email}.');
  }

  Future<void> encodeJson() async {
    Map<String, dynamic> userMap = {
      'name': 'jota',
      'email': 'jota@example.com',
    };
    // String userString = json.encode(userMap); // Manual approach
    // debugPrint(userString);

    User user = User('jota', 'jota@example.com');
    userMap = user.toJson();
    debugPrint(userMap.toString());
  }
}
