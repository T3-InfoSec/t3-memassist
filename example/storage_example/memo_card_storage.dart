import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() async {
  // Initialize Hive
  Hive.init('hive_test_directory');
  
  // Register the generated adapter
  Hive.registerAdapter(MemoCardDAOAdapter());

  // Open the box
  var box = await Hive.openBox<MemoCardDAO>('memoCardBox');

  // Create an instance of MemoCardDAO
  var memoCard = MemoCardDAO('node hash Example', DateTime.now().add(Duration(days: 1)));

  // Store the instance in the box
  await box.put('exampleKey', memoCard);

  // Retrieve the instance from the box
  var storedMemoCard = box.get('exampleKey');

  print('Stored nodeHash: ${storedMemoCard?.nodeHash}');
  print('Stored due date: ${storedMemoCard?.due}');

  // Delete the box after the test if desired
  await box.deleteFromDisk();
  print('Box deleted');
}
