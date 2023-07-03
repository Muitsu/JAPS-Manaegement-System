import 'package:japs/data/repository/gang_model.dart';
import 'package:japs/data/repository/harvester_model.dart';
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

  Future<bool> harvesterHasData() async {
    final db = await instance.database;
    final data =
        await db.rawQuery('SELECT * FROM ${HarvesterFields.tableName}');

    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> insertHarvester({required HarvesterModel model}) async {
    final db = await instance.database;
    return await db.insert(HarvesterFields.tableName, model.toJson());
  }

  Future<List<HarvesterModel>> fetchHarvester() async {
    final db = await instance.database;
    final data = await db.rawQuery(
        'SELECT * FROM ${HarvesterFields.tableName} ORDER BY ${HarvesterFields.id} ASC');

    if (data.isNotEmpty) {
      return data.map((json) => HarvesterModel.fromJson(json)).toList();
    } else {
      throw Exception('ID not found');
      // return null;
    }
  }

  Future<List<GangModel>> fetchGangList({required int id}) async {
    final db = await instance.database;
    final data = await db.rawQuery(
        'SELECT * FROM ${GangFields.tableName}  WHERE ${GangFields.id} = $id');

    if (data.isNotEmpty) {
      return data.map((json) => GangModel.fromJson(json)).toList();
    } else {
      // throw Exception('ID not found');
      return [];
    }
  }
}
