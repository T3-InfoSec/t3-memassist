import 'package:memo_assistant/src/core/services/memo_card_service.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardService', () {
    test('alwaysTrue returns true', () {
      final memoCardService = MemoCardService();
      expect(memoCardService.alwaysTrue(), isTrue);
    });
  });
}