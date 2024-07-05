import 'package:memo_assistant/src/infrastructure/models/memo_card_mapper.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardService', () {
    test('alwaysTrue returns true', () {
      final memoCardMapper = MemoCardMapper();
      expect(memoCardMapper.alwaysTrue(), isTrue);
    });
  });
}