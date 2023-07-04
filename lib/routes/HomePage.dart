import 'package:flutter/material.dart';
import 'package:insolite/main.dart';
import 'package:provider/provider.dart';

import '../viewmodels/MainViewModel.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

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
          Consumer<MainViewModel>(
            builder: (context, mainViewModel, child) => Center(
              child: MyButton(
                text: "Valider ${mainViewModel.playersValue} joueurs",
                onClick: () {
                  Navigator.pushNamed(context, '/players');
                  mainViewModel.validatePlayersValue();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
