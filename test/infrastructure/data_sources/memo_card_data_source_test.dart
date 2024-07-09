import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

import 'package:test/test.dart';

import 'package:hive_test/hive_test.dart';

void main() {
  group('HiveMemoCardDataSource Tests', () {
    late HiveMemoCardDataSource dataSource;
    
    setUp(() async {
      await setUpTestHive();
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(MemoCardDAOAdapter());
      }
      dataSource = HiveMemoCardDataSource();
      await dataSource.openBox();
    });
    
    tearDown(() async {
      await dataSource.closeBox();
      await tearDownTestHive();
    });

    test('Should initialize hive', () async {
      expect(dataSource.box.isOpen, isTrue);
    });

    test('Save and Retrieve MemoCard', () async {
      MemoCardDAO card = MemoCardDAO('any knowledge', DateTime.now());

      await dataSource.addMemoCard(card);
      var retrievedCard = await dataSource.getMemoCard(card.key as int);

      expect(retrievedCard?.nodeHash, card.nodeHash);
      expect(retrievedCard?.due, card.due);
    });

    test('Get All MemoCards', () async {

      MemoCardDAO card1 = MemoCardDAO('Knowledge 1', DateTime.now());
      MemoCardDAO card2 = MemoCardDAO('Knowledge 2', DateTime.now());
      MemoCardDAO card3 = MemoCardDAO('Knowledge 3', DateTime.now());

      await dataSource.addMemoCard(card1);
      await dataSource.addMemoCard(card2);
      await dataSource.addMemoCard(card3);

      var allCards = dataSource.getAllMemoCards();

      expect(allCards.length, equals(3));
      expect(allCards[0].nodeHash, card1.nodeHash);
      expect(allCards[0].due, card1.due);
      expect(allCards[1].nodeHash, card2.nodeHash);
      expect(allCards[1].due, card2.due);
      expect(allCards[2].nodeHash, card3.nodeHash);
      expect(allCards[2].due, card3.due);
    });

    test('Delete MemoCard', () async {

      MemoCardDAO card = MemoCardDAO('any knowledge', DateTime.now());
      await dataSource.addMemoCard(card);

      int key = card.key as int;

      await dataSource.deleteMemoCard(card);
      var retrievedCard = await dataSource.getMemoCard(key);

      expect(retrievedCard, isNull);
    });


  });
}
