import 'package:card/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class GameModel with ChangeNotifier {
  int _balance = 8;
  int get balance => _balance;

  int _debt = 0;
  int get debt => _debt;

  int _secretKey = Utils.random();
  int get secretKey => _secretKey;

  void addDebt() {
    _debt = _debt + 8;
    _balance = _balance + 8;
    notifyListeners();
  }

  List<int> _card = [0, 0, 0];
  List<int> get card => _card;

  void addCoins(i) {
    _card[i] = _card[i] + 1;
    _balance--;
    notifyListeners();
  }

  void removeCoins(i) {
    _card[i] = _card[i] - 1;
    _balance++;
    notifyListeners();
  }

  bool _played = false;
  bool get played => _played;

  int _wonAmount = 0;
  int get wonAmount => _wonAmount;

  void play() {
    _played = true;
    _wonAmount = _card[_secretKey] * 3;
    _balance = _balance + _wonAmount;
    notifyListeners();
  }

  void reset() {
    _played = false;
    _wonAmount = 0;
    _secretKey = Utils.random();
    _card = [0, 0, 0];
    notifyListeners();
  }
}
