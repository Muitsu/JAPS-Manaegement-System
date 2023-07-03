import 'package:japs/data/datasource/local/tables/db_fields.dart';
import 'package:japs/data/datasource/local/db_utils.dart';

enum DBTables {
  // masterTable(
  //   table: CreateTable(
  //     tableName: MasterFields.tableName,
  //     column: [
  //       ColumnField(colName: MasterFields.date, fieldType: FieldType.date),
  //       ColumnField(
  //           colName: MasterFields.createdDate, fieldType: FieldType.dateTime),
  //       ColumnField(
  //           colName: MasterFields.updatedDate, fieldType: FieldType.dateTime),
  //     ],
  //   ),
  // ),
  upkeepTable(
    table: CreateTable(
      tableName: UpkeepFields.tableName,
      column: [
        ColumnField(
            colName: UpkeepFields.id, fieldType: FieldType.idTypeNumber),
        ColumnField(colName: UpkeepFields.date, fieldType: FieldType.date),
        ColumnField(colName: UpkeepFields.fieldNo, fieldType: FieldType.text),
        //
        ColumnField(
            colName: UpkeepFields.manuFertType, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuNoWorkers, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuNoTracDriver, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuMethod, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuPrestMandor, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuTotIssueBag, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuHectCoverTarget,
            fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.manuHectCoverAct, fieldType: FieldType.text),
        //
        ColumnField(
            colName: UpkeepFields.sprayChecmiType, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayNoWorkers, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayNoTracDriver, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayMethod, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayPrestMandor, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayHectCoverTarget,
            fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.sprayHectCoverAct, fieldType: FieldType.text),
        //
        ColumnField(colName: UpkeepFields.weedType, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.weedNoWorkers, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.weedNoTracDriver, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.weedPrestMandor, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.weedHectCoverTarget,
            fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.weedHectCoverAct, fieldType: FieldType.text),
        //
        ColumnField(colName: UpkeepFields.pndType, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.pndNoWorkers, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.pndNoTracDriver, fieldType: FieldType.text),
        ColumnField(colName: UpkeepFields.pndChemi, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.pndPrestMandor, fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.pndHectCoverTarget,
            fieldType: FieldType.text),
        ColumnField(
            colName: UpkeepFields.pndHectCoverAct, fieldType: FieldType.text),
        //
        ColumnField(
            colName: UpkeepFields.createdDate, fieldType: FieldType.dateTime),
        ColumnField(
            colName: UpkeepFields.updatedDate, fieldType: FieldType.dateTime),
      ],
    ),
  ),
  harvesterTable(
    table: CreateTable(
      tableName: HarvesterFields.tableName,
      column: [
        ColumnField(colName: HarvesterFields.date, fieldType: FieldType.date),
        ColumnField(
            colName: HarvesterFields.createdDate,
            fieldType: FieldType.dateTime),
        ColumnField(
            colName: HarvesterFields.updatedDate,
            fieldType: FieldType.dateTime),
      ],
    ),
  ),
  ;

  final CreateTable table;
  const DBTables({required this.table});
}
