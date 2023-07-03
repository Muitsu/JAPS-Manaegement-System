import 'package:japs/data/repository/upkeep_model.dart';

import '../datasource/local/tables/db_fields.dart';
import '../datasource/local/db_manager.dart';

class LocalDBRepo {
  DBManager instance = DBManager.instance;
  Future<bool> upkeepHasData() async {
    final db = await instance.database;
    final data = await db.rawQuery('SELECT * FROM ${UpkeepFields.tableName}');

    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> insertUpkeep({required UpkeepModel upkeepModel}) async {
    final db = await instance.database;
    await db.insert(UpkeepFields.tableName, upkeepModel.toJson());
  }

  Future<List<UpkeepModel>> fetchUpkeep() async {
    final db = await instance.database;
    final data = await db.rawQuery(
        'SELECT * FROM ${UpkeepFields.tableName} ORDER BY ${UpkeepFields.id} ASC');

    if (data.isNotEmpty) {
      return data.map((json) => UpkeepModel.fromJson(json)).toList();
    } else {
      throw Exception('ID not found');
      // return null;
    }
  }

  Future<void> updateUpkeep({required UpkeepModel model}) async {
    final db = await instance.database;
    await db.update(UpkeepFields.tableName, model.toJson(),
        where: '${UpkeepFields.id} = ?', whereArgs: [model.id]);
  }

//   Future<void> updateStatusList({
//     required int id,
//     required int status,
//   }) async {
//     final db = await instance.database;
//     await db.rawUpdate(
//         'UPDATE ${TodoFields.tableName} SET ${TodoFields.status} = ?  WHERE ${TodoFields.id} = ?',
//         [status, id]);
//   }

//   Future<void> deleteTodo({required TodoListModel model}) async {
//     final db = await instance.database;
//     await db.rawDelete(
//         'DELETE FROM ${TodoFields.tableName} WHERE ${TodoFields.id} = ${model.id}');
//   }
}
