// class MasterFields {
//   static const String tableName = 'master_table';
//   static const String foreignId = 'foreign_id';
//   static const String fieldNo = 'field_no';
//   static const String date = 'date';
//   static const String createdDate = 'created_date';
//   static const String updatedDate = 'updated_date';
// }

class UpkeepFields {
  static const String tableName = 'upkeep_table';
  static const String id = 'id';
  static const String fieldNo = 'field_no';
  static const String manuFertType = 'manuFertType';
  static const String manuNoWorkers = 'manuNoWorkers';
  static const String manuNoTracDriver = 'manuNoTracDriver';
  static const String manuPrestMandor = 'manuPrestMandor';
  static const String manuMethod = 'manuMethod';
  static const String manuHectCoverTarget = 'manuHectCoverTarget';
  static const String manuTotIssueBag = 'manuTotIssueBag';
  static const String manuHectCoverAct = 'manuHectCoverAct';
  //
  static const String sprayChecmiType = 'sprayChecmiType';
  static const String sprayNoWorkers = 'sprayNoWorkers';
  static const String sprayNoTracDriver = 'sprayNoTracDriver';
  static const String sprayPrestMandor = 'sprayPrestMandor';
  static const String sprayMethod = 'sprayMethod';
  static const String sprayHectCoverTarget = 'sprayHectCoverTarget';
  static const String sprayHectCoverAct = 'sprayHectCoverAct';
  //
  static const String weedType = 'weedType';
  static const String weedNoWorkers = 'weedNoWorkers';
  static const String weedNoTracDriver = 'weedNoTracDriver';
  static const String weedPrestMandor = 'weedPrestMandor';
  static const String weedHectCoverTarget = 'weedHectCoverTarget';
  static const String weedHectCoverAct = 'weedHectCoverAct';
  //
  static const String pndType = 'pndType';
  static const String pndNoWorkers = 'pndNoWorkers';
  static const String pndNoTracDriver = 'pndNoTracDriver';
  static const String pndPrestMandor = 'pndPrestMandor';
  static const String pndChemi = 'pndChemi';
  static const String pndHectCoverTarget = 'pndHectCoverTarget';
  static const String pndHectCoverAct = 'pndHectCoverAct';
//
  static const String date = 'date';
  static const String createdDate = 'created_date';
  static const String updatedDate = 'updated_date';
}

class HarvesterFields {
  static const String tableName = 'harvester_table';
  static const String id = 'id';
  static const String fieldNo = 'field_no';
  static const String date = 'date';
  static const String createdDate = 'created_date';
  static const String updatedDate = 'updated_date';
}

class GangFields {
  static const String tableName = 'gang_table';
  static const String id = 'id';
  static const String harvId = 'harvester_id';
  static const String gangNo = 'gang_no';
  static const String noHarvester = 'no_harvester';
  static const String noCutter = 'no_cutter';
  static const String evitMethod = 'evit_method';
  static const String targetMt = 'target_mt';
  static const String balanceMtToday = 'balance_mt_today';
  static const String balanceMtPrev = 'balance_mt_prev';
  static const String totalBin = 'total_bin';
  static const String cutTotHect = 'cutTotHect';
  static const String cutTotDispt = 'cutTotDispt';
  static const String harvTotHect = 'harvTotHect';
  static const String harvTotDispt = 'harvTotDispt';
}
