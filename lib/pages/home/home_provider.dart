import 'package:flutter/material.dart';
import 'package:japs/data/repository/local_db_repo.dart';
import 'package:japs/data/repository/upkeep_model.dart';

class HomeProvier extends ChangeNotifier {
  List<UpkeepModel> upkeepList = [];

  void fetchUpkeepList() async {
    upkeepList = await LocalDBRepo().fetchUpkeep();
    notifyListeners();
  }
}
