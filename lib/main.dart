import 'package:card/game_model.dart';
import 'package:card/game_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameModel()),
      ],
      child: MaterialApp(
        title: 'Where is the flutter?',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GameRoute(title: 'Where is the flutter?'),
      ),
    );
  }
}

