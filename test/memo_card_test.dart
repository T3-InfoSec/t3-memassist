// TODO implement test for MemoCard
import 'package:memo_assistant/memo_card.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCard', () {
    test('alwaysTrue returns true', () {
      final card = MemoCard();
      expect(card.alwaysTrue(), isTrue);
    });
  });
}