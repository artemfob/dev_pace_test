import 'package:flutter/cupertino.dart';

class ListState with ChangeNotifier {
  List<int> data = [];

  void addItem() {
    data.add(0);
    notifyListeners();
  }

  void removeItem() {
    if (data.isNotEmpty) {
      data.removeLast();
    }
    notifyListeners();
  }
}
