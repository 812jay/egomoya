import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:flutter/material.dart';

class CelebService with ChangeNotifier {
  List<Celeb> celebList = [];

  setCelebList(List<Celeb> newCelebList) {
    celebList = newCelebList;
    notifyListeners();
  }
}
