import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() async {
  Hive.init('hive_example_directory');
  Hive.registerAdapter(MemoCardDAOAdapter());
  final dataSource = HiveMemoCardDataSource();
  await dataSource.openBox();
  await dataSource.box.deleteFromDisk();
  print('Box deleted');
}