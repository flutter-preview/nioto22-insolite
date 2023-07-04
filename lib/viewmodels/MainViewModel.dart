import 'package:flutter/foundation.dart';

class MainViewModel {
  int playersValue = 2;

  void updatePlayersValue(int value) {
    playersValue = value;
    if (kDebugMode) {
      print(playersValue);
    }
  }

  void validatePlayersValue() {
    if (kDebugMode) {
      print("Valider $playersValue joueurs");
    }
  }
}