import 'package:flutter/material.dart';
import 'package:frontend_get_api/models/user_model.dart';
import 'package:frontend_get_api/provider/post_provider.dart';
import 'package:frontend_get_api/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'provider/users_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: const MaterialApp(home: HomePage()),
      providers: [
        ChangeNotifierProvider<UsersProvider>(
          create: (_) => UsersProvider(),
        ),
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
      ],
    );
    /* return  ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MaterialApp(home: HomePage()),
    );  */
    /* ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MaterialApp(home: HomePage()),
    ); */
  }
}
/* create: (context) => PostProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ), */

      /* MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
        ChangeNotifierProvider<UsersProvider>(
          create: (_) => UsersProvider().,
        ),
      ],
    ); */