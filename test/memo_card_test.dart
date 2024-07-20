import 'package:test/test.dart';
import 'package:fsrs/fsrs.dart';

import 'package:memory_assistant/memory_assistant.dart';

void main() {
  group('MemoCard tests', () {
    test('Initialization test', () {
      var memoCard = MemoCard({
        "test": ["knowledge"]
      });
      expect(memoCard.knowledge, {
        "test": ["knowledge"]
      });
      expect(memoCard.due, isNotNull);
      expect(memoCard.state, State.newState.val);
    });

    test('Rate card test', () {
      var memoCard = MemoCard({
        "test": ["knowledge"]
      });
      expect(memoCard.state, State.newState.val);

      // First rating
      DateTime beforeFirstRate = DateTime.now().toUtc();
      memoCard.rateCard('hard');
      DateTime afterFirstRate = DateTime.now().toUtc();
      expect(memoCard.state, State.newState.val);
      expect(memoCard.due!.isAfter(beforeFirstRate), isTrue);

      // Second rating
      memoCard.rateCard('good');
      DateTime afterSecondRate = DateTime.now().toUtc();
      expect(memoCard.state, State.learning.val);
      expect(memoCard.due!.isAfter(afterFirstRate), isTrue);

      // Third rating
      memoCard.rateCard('easy');
      DateTime afterThirdRate = DateTime.now().toUtc();
      expect(memoCard.state, State.review.val);
      expect(memoCard.due!.isAfter(afterSecondRate), isTrue);

      // Fourth and fifth rating to trigger relearning
      memoCard.rateCard('again');
      expect(memoCard.state, State.review.val);
      memoCard.rateCard('again');
      expect(memoCard.state, State.relearning.val);
      expect(memoCard.due!.isAfter(afterThirdRate), isTrue);
    });

    test('ToString test', () {
      var memoCard = MemoCard({
        "test": ["knowledge"]
      });
      String expectedString =
          'Memorization Card for Knowledge: ${memoCard.knowledge}; with state: ${memoCard.state} and due at: ${memoCard.due}.';
      expect(memoCard.toString(), expectedString);
    });
  });
}
