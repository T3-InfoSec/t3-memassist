import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() async {
  Hive.init('hive_test_directory');
  
  Hive.registerAdapter(MemoCardDAOAdapter());

  var box = await Hive.openBox<MemoCardDAO>('memoCardBox');

  var storedMemoCard = box.get('exampleKey');

  if (storedMemoCard != null) {
    print('Stored nodeHash: ${storedMemoCard.nodeHash}');
    print('Stored due date: ${storedMemoCard.due}');
  } else {
    print('No card found with the given key.');
  }

  // Close the box
  await box.close();
}
