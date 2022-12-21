import 'package:flutter/material.dart';
import 'package:frontend_get_api/provider/post_provider.dart';
import 'package:frontend_get_api/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MaterialApp(home: HomePage()),
    );
  }
}
