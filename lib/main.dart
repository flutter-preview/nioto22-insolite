import 'package:flutter/material.dart';
import 'package:insolite/viewmodels/MainViewModel.dart';
import 'package:insolite/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(
        body: HomePage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainViewModel mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity, // take all the width
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const Center(
              child: TitleBold("Sélectionne le nombre de joueurs :"),
            ),
          ),
          Container(
            width: double.infinity, // take all the width
            margin: const EdgeInsets.only(bottom: 32.0),
            child: Center(
              child: MyNumberPicker(
                onValueChanged: (value) {
                  setState(() {
                    mainViewModel.updatePlayersValue(value);
                  });
                },
              ),
            ),
          ),
          Center(
            child: MyButton(
              text: "Valider ${mainViewModel.playersValue} joueurs",
              onClick: () {
                mainViewModel.validatePlayersValue();
              },
            ),
          )
        ],
      ),
    );
  }
}
