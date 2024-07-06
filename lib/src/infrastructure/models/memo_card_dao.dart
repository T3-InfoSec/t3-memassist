import 'package:hive/hive.dart';

part 'memo_card_dao.g.dart';

@HiveType(typeId: 0)
class MemoCardDAO extends HiveObject {
  @HiveField(0)
  String nodeHash;

  @HiveField(1)
  DateTime? due;

  MemoCardDAO(this.nodeHash, this.due);
}