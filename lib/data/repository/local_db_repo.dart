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
      // throw Exception('ID not found');
      return [];
    }
  }

  Future<void> updateUpkeep({required UpkeepModel model}) async {
    final db = await instance.database;
    await db.update(UpkeepFields.tableName, model.toJson(),
        where: '${UpkeepFields.id} = ?', whereArgs: [model.id]);
  }

  Future<void> deleteUpkeep({required int id}) async {
    final db = await instance.database;
    await db.delete(UpkeepFields.tableName,
        where: '${UpkeepFields.id} = ?', whereArgs: [id]);
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

  Future<void> updateHarvester(
      {required int id, required String fieldNo}) async {
    final db = await instance.database;

    final data = await db.query(HarvesterFields.tableName,
        where: '${HarvesterFields.id} = ?', whereArgs: [id]);

    final model = HarvesterModel.fromJson(data[0]).copyWith(fieldNo: fieldNo);

    await db.update(HarvesterFields.tableName, model.toJson(),
        where: '${HarvesterFields.id} = ?', whereArgs: [model.id]);
  }

  Future<void> deleteHarvester({required int id}) async {
    final db = await instance.database;
    await db.delete(HarvesterFields.tableName,
        where: '${HarvesterFields.id} = ?', whereArgs: [id]);
    final data = await db.rawQuery(
        'SELECT * FROM ${GangFields.tableName}  WHERE ${GangFields.harvId} = $id');
    if (data.isNotEmpty) {
      await db.delete(GangFields.tableName,
          where: '${GangFields.harvId} = ?', whereArgs: [id]);
    }
  }

  Future<List<HarvesterModel>> fetchHarvester() async {
    final db = await instance.database;
    final data = await db.rawQuery(
        'SELECT * FROM ${HarvesterFields.tableName} ORDER BY ${HarvesterFields.id} ASC');

    if (data.isNotEmpty) {
      return data.map((json) => HarvesterModel.fromJson(json)).toList();
    } else {
      // throw Exception('ID not found');
      return [];
    }
  }

  Future<int> insertGang({required GangModel model}) async {
    final db = await instance.database;
    return await db.insert(GangFields.tableName, model.toJson());
  }

  Future<List<GangModel>> fetchGangList({required int id}) async {
    final db = await instance.database;
    final data = await db.rawQuery(
        'SELECT * FROM ${GangFields.tableName}  WHERE ${GangFields.harvId} = $id');
    if (data.isNotEmpty) {
      return data.map((json) => GangModel.fromJson(json)).toList();
    } else {
      // throw Exception('ID not found');
      return [];
    }
  }

  Future<void> updateGang({required GangModel model}) async {
    final db = await instance.database;
    await db.update(GangFields.tableName, model.toJson(),
        where: '${GangFields.id} = ?', whereArgs: [model.id]);
  }

  Future<void> deleteGang({required GangModel model}) async {
    final db = await instance.database;
    await db.delete(GangFields.tableName,
        where: '${GangFields.id} = ?', whereArgs: [model.id]);
  }
}
