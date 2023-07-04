import 'package:flutter/foundation.dart';

class MainViewModel extends ChangeNotifier {
  int playersValue = 2;

  void updatePlayersValue(int value) {
    playersValue = value;
    if (kDebugMode) {
      print(playersValue);
    }
    notifyListeners();
  }

  void validatePlayersValue() {
    if (kDebugMode) {
      print("Valider $playersValue joueurs");
    }
  }

  // Whenever your state changes, call notifyListeners() to
  // inform the Provider package to rebuild the widgets that
  // depend on this ViewModel.
  void someMethodThatChangesState() {
    // change state
    notifyListeners();
  }
}