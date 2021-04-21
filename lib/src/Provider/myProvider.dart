import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  bool searchClick=false;


  void searchButton() {
    searchClick=true;
    notifyListeners();
  }

}