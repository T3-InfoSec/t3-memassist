import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MemoCardDAOAdapter());
    }
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  group('MemoCardDAO', () {
    test('should store and retrieve a memo card', () async {
      var box = await Hive.openBox<MemoCardDAO>('testBox');

      var memoCard = MemoCardDAO('any_hash', DateTime(2023, 7, 7));
      await box.put('any_key', memoCard);

      var retrievedMemoCard = box.get('any_key') as MemoCardDAO;
      expect(retrievedMemoCard.nodeHash, 'any_hash');
      expect(retrievedMemoCard.due, DateTime(2023, 7, 7));
    });

    test('should handle null due date', () async {
      var box = await Hive.openBox<MemoCardDAO>('testBox');

      var memoCard = MemoCardDAO('any_hash', null);
      await box.put('any_key', memoCard);

      var retrievedMemoCard = box.get('any_key') as MemoCardDAO;
      expect(retrievedMemoCard.nodeHash, 'any_hash');
      expect(retrievedMemoCard.due, isNull);
    });
  });
}
