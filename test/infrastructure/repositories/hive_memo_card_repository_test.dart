import 'package:memo_assistant/src/infrastructure/repositories/hive_memo_card_repository.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardService', () {
    test('alwaysTrue returns true', () {
      final hiveMemoCardRepository = HiveMemoCardRepository();
      expect(hiveMemoCardRepository.alwaysTrue(), isTrue);
    });
  });
}