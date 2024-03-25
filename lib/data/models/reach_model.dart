// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reach_collect/network/presistance/database_table.dart';

class ReachCollectVo {
  int? id;
  String? name;
  String? age;
  String? date;
  String? disability;
  String? idp;
  String? gestational;
  String? gravida;
  String? parity;
  String? td;
  String? findings;
  String? treatment;
  String? attended;
  String? outcome;
  String? remark;

  ReachCollectVo({
    this.id,
    this.name,
    this.age,
    this.date,
    this.disability,
    this.idp,
    this.gestational,
    this.gravida,
    this.parity,
    this.td,
    this.findings,
    this.treatment,
    this.attended,
    this.outcome,
    this.remark,
  });

  Map<String, dynamic> toMap() {
    return {
      ReachCollectTable.COLUMM_Id: id,
      ReachCollectTable.COLUMN_NAME_Name: name,
      ReachCollectTable.COLUMN_NAME_Age: age,
      ReachCollectTable.COLUMN_NAME_Date: date,
      ReachCollectTable.COLUMN_NAME_Disability: disability,
      ReachCollectTable.COLUMN_NAME_IDP: idp,
      ReachCollectTable.COLUMN_NAME_Gestational: gestational,
      ReachCollectTable.COLUMN_NAME_Gravida: gravida,
      ReachCollectTable.COLUMN_NAME_Parity: parity,
      ReachCollectTable.COLUMN_NAME_Td: td,
      ReachCollectTable.COLUMN_NAME_Findings: findings,
      ReachCollectTable.COLUMN_NAME_Treatment: treatment,
      ReachCollectTable.COLUMN_NAME_Attended: attended,
      ReachCollectTable.COLUMN_NAME_Outcome: outcome,
      ReachCollectTable.COLUMN_NAME_Remark: remark,
    };
  }

 
}
