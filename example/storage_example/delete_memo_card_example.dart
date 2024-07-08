import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() async {
  Hive.init('hive_test_directory');
  
  Hive.registerAdapter(MemoCardDAOAdapter());

  var box = await Hive.openBox<MemoCardDAO>('memoCardBox');

  await box.deleteFromDisk();

  print('Box deleted');
}