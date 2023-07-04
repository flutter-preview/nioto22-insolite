import 'package:flutter/material.dart';
import 'package:insolite/viewmodels/MainViewModel.dart';
import 'package:insolite/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'routes/GamePage.dart';
import 'routes/HomePage.dart';
import 'routes/PlayersPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainViewModel(),
      child: MaterialApp(
        title: 'Insolite',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/players': (context) => const PlayersPage(),
          '/game': (context) => const GamePage(),
        },
      ),
    ),
  );
}

