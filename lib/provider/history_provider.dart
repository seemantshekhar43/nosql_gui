import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:nosql_gui/models/history.dart';

class HistoryProvider extends ChangeNotifier{
  final List<History> _list = [];

  UnmodifiableListView<History> get list => UnmodifiableListView(_list);

  void addHistory(History history){
    _list.add(history);
    notifyListeners();
  }

  void removeAll(){
    _list.clear();
    notifyListeners();
  }
}