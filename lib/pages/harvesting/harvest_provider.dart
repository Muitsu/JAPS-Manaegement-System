import 'package:flutter/material.dart';
import 'package:japs/data/repository/gang_model.dart';

import '../../data/repository/local_db_repo.dart';

class HarvestProvider extends ChangeNotifier {
  List<GangModel> gangList = [];
  void fetchGangList({required int id}) async {
    gangList = await LocalDBRepo().fetchGangList(id: id);
    notifyListeners();
  }
}
