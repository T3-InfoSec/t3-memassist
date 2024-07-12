import 'package:hive/hive.dart';
import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() async {

  Hive.init('hive_test_directory');
  
  Hive.registerAdapter(MemoCardDAOAdapter());

  var box = await Hive.openBox<MemoCardDAO>('memoCardBox');

  var memoCard = MemoCard('node');
  memoCard.rateCard('good');
  var nodeHash = HashUtils.generateSHA256(memoCard.node.toString());

  var memoCardDAO = MemoCardDAO(nodeHash, memoCard.due);

  await box.put('exampleKey', memoCardDAO);

  print('Card stored');
  
  await box.close();
}
