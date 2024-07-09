import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:memo_assistant/src/infrastructure/repositories/hive_memo_card_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([HiveMemoCardDataSource])
import 'hive_memo_card_repository_test.mocks.dart';

void main() {
  group('HiveMemoCardRepository Tests', () {
    late HiveMemoCardRepository repository;
    late MockHiveMemoCardDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockHiveMemoCardDataSource();
      repository = HiveMemoCardRepository(mockDataSource);
    });

    test('addMemoCard should call addMemoCard on dataSource', () async {
      MemoCard card = MemoCard('Knowledge Example', DateTime.now());

      await repository.addMemoCard(card);

      verify(mockDataSource.addMemoCard(any)).called(1);
    });

    test('getAllMemoCards should return list of MemoCardDetails', () {
      List<MemoCardDAO> daoList = [
        MemoCardDAO('hash1', DateTime.now()),
        MemoCardDAO('hash2', DateTime.now().add(Duration(days: 1))),
      ];

      when(mockDataSource.getAllMemoCards()).thenReturn(daoList);

      List<MemoCardDetails> result = repository.getAllMemoCards();

      expect(result.length, 2);
      expect(result[0].nodeHash, 'hash1');
      expect(result[1].nodeHash, 'hash2');
    });

    test('getMemoCard should return MemoCardDetails for valid key', () async {
      MemoCardDAO dao = MemoCardDAO('hash1', DateTime.now());

      when(mockDataSource.getMemoCard(1)).thenAnswer((_) async => dao);

      MemoCardDetails result = await repository.getMemoCard(1);

      expect(result.nodeHash, 'hash1');
    });

    test('getMemoCard should throw exception for invalid key', () async {
      when(mockDataSource.getMemoCard(1)).thenAnswer((_) async => null);

      expect(() => repository.getMemoCard(1), throwsException);
    });

    test('deleteMemoCard should call deleteMemoCard on dataSource', () async {
      MemoCard card = MemoCard('Knowledge Example', DateTime.now());

      await repository.deleteMemoCard(card);

      verify(mockDataSource.deleteMemoCard(any)).called(1);
    });
  });
}
