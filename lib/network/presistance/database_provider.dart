import 'package:reach_collect/data/models/reach_model.dart';
import 'package:reach_collect/network/presistance/database_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = "reachdb";
  static const String TEXT_TYPE = " TEXT";
  static const String INTEGER_TYPE = " INTEGER";
  static const String BOOL_TYPE = 'INTEGER';
  static const String DOUBLE_TYPE = " REAL";
  static const String INTEGER_AUTO_INCREMENT =
      " INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL";

  //Medical Table
  static const String SQL_CREATE_REACH_TABLE =
      "CREATE TABLE ${ReachCollectTable.TABLE_NAME} (${ReachCollectTable.COLUMM_Id} $INTEGER_AUTO_INCREMENT,${ReachCollectTable.COLUMN_NAME_Name}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Age}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Date}$TEXT_TYPE,Disability $TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_IDP}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Gestational}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Gravida}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Parity}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Td}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Findings}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Treatment}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Attended}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Outcome}$TEXT_TYPE,${ReachCollectTable.COLUMN_NAME_Remark}$TEXT_TYPE)";

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, DATABASE_NAME),
        version: DATABASE_VERSION,
        onCreate: (Database database, int version) async {
      await database.execute(SQL_CREATE_REACH_TABLE);
    });
  }

  Future insertDataToDB(ReachCollectVo reachCollectVo) async {
    final db = await database;
    Batch batch = db.batch();

    var data = <String, dynamic>{
      // ReachCollectTable.COLUMM_Id: reachCollectVo.id,
      ReachCollectTable.COLUMN_NAME_Name: reachCollectVo.name,
      ReachCollectTable.COLUMN_NAME_Age: reachCollectVo.age,
      ReachCollectTable.COLUMN_NAME_Date: reachCollectVo.date,
      ReachCollectTable.COLUMN_NAME_Disability: reachCollectVo.disability,
      ReachCollectTable.COLUMN_NAME_IDP: reachCollectVo.idp,
      ReachCollectTable.COLUMN_NAME_Gestational: reachCollectVo.gestational,
      ReachCollectTable.COLUMN_NAME_Gravida: reachCollectVo.gravida,
      ReachCollectTable.COLUMN_NAME_Parity: reachCollectVo.parity,
      ReachCollectTable.COLUMN_NAME_Findings: reachCollectVo.findings,
      ReachCollectTable.COLUMN_NAME_Td: reachCollectVo.td,
      ReachCollectTable.COLUMN_NAME_Treatment: reachCollectVo.treatment,
      ReachCollectTable.COLUMN_NAME_Attended: reachCollectVo.attended,
      ReachCollectTable.COLUMN_NAME_Outcome: reachCollectVo.outcome,
      ReachCollectTable.COLUMN_NAME_Remark: reachCollectVo.remark,
    };
    //inset village
    batch.insert(ReachCollectTable.TABLE_NAME, data,
        conflictAlgorithm: ConflictAlgorithm.abort);

    batch.commit();
    return;
  }

  Future<List<ReachCollectVo>> getAllDataFromDB() async {
    final db = await database;
    List<ReachCollectVo> reachCollectData = [];
    dynamic reachCollectValue = await db.rawQuery(
        "SELECT * FROM '${ReachCollectTable.TABLE_NAME}';", null);

    for (var reachCollect in reachCollectValue) {
      ReachCollectVo reachcollectVo = ReachCollectVo();
      reachcollectVo.id = reachCollect[ReachCollectTable.COLUMM_Id];
      reachcollectVo.age = reachCollect[ReachCollectTable.COLUMN_NAME_Age];
      reachcollectVo.name = reachCollect[ReachCollectTable.COLUMN_NAME_Name];
      reachcollectVo.date = reachCollect[ReachCollectTable.COLUMN_NAME_Date];
      reachcollectVo.disability =
          reachCollect[ReachCollectTable.COLUMN_NAME_Disability];
      reachcollectVo.idp = reachCollect[ReachCollectTable.COLUMN_NAME_IDP];
      reachcollectVo.gestational =
          reachCollect[ReachCollectTable.COLUMN_NAME_Gestational];
      reachcollectVo.gravida =
          reachCollect[ReachCollectTable.COLUMN_NAME_Gravida];
      reachcollectVo.parity =
          reachCollect[ReachCollectTable.COLUMN_NAME_Parity];
      reachcollectVo.td = reachCollect[ReachCollectTable.COLUMN_NAME_Td];
      reachcollectVo.findings =
          reachCollect[ReachCollectTable.COLUMN_NAME_Findings];
      reachcollectVo.treatment =
          reachCollect[ReachCollectTable.COLUMN_NAME_Treatment];
      reachcollectVo.attended =
          reachCollect[ReachCollectTable.COLUMN_NAME_Attended];
      reachcollectVo.outcome =
          reachCollect[ReachCollectTable.COLUMN_NAME_Outcome];
      reachcollectVo.remark =
          reachCollect[ReachCollectTable.COLUMN_NAME_Remark];
      reachCollectData.add(reachcollectVo);
    }
    return reachCollectData;
  }

  Future deleteFromDB(int id) async {
    final db = await database;
    Batch batch = db.batch();
    batch.delete(ReachCollectTable.TABLE_NAME,
        where: 'id = ?', whereArgs: [id]);
    batch.commit();
    return;
  }

  Future updateUserInto(ReachCollectVo reachVo) async {
    final db = await database;
    Batch batch = db.batch();
    batch.update(ReachCollectTable.TABLE_NAME,reachVo.toMap(),
        where: 'id = ?', whereArgs: [reachVo.id],);
    await batch.commit();
    return;
  }
}
