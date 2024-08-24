import 'package:test/test.dart';
import 'package:fsrs/fsrs.dart';

import 'package:memory_assistant/memory_assistant.dart';

void main() {
  group('MemoCard tests', () {
    test('Initialization with knowledge test', () {
      var memoCard = MemoCard(
        knowledge: {
          "test": ["knowledge"]
        },
      );
      expect(memoCard.knowledge, {
        "test": ["knowledge"]
      });
      expect(memoCard.due, isNotNull);
      expect(memoCard.state, 'New');
    });

    test('Rate card test', () {
      var memoCard = MemoCard(
        knowledge: {
          "test": ["knowledge"]
        },
      );
      expect(memoCard.state, 'New');

      // First rating
      DateTime beforeFirstRate = DateTime.now().toUtc();
      memoCard.rateCard('hard');
      DateTime afterFirstRate = DateTime.now().toUtc();
      expect(memoCard.state, 'Learning');
      expect(memoCard.due!.isAfter(beforeFirstRate), isTrue);

      // Second rating
      memoCard.rateCard('good');
      DateTime afterSecondRate = DateTime.now().toUtc();
      expect(memoCard.state, 'Learning');
      expect(memoCard.due!.isAfter(afterFirstRate), isTrue);

      // Third rating
      memoCard.rateCard('easy');
      DateTime afterThirdRate = DateTime.now().toUtc();
      expect(memoCard.state, 'Learning');
      expect(memoCard.due!.isAfter(afterSecondRate), isTrue);

      // Fourth and fifth rating to trigger relearning
      memoCard.rateCard('again');
      expect(memoCard.state, 'Review');
      memoCard.rateCard('again');
      expect(memoCard.state, 'Relearning');
      expect(memoCard.due!.isAfter(afterThirdRate), isTrue);
    });

    test('ToString test', () {
      var memoCard = MemoCard(
        knowledge: {
          "test": ["knowledge"]
        },
      );
      String expectedString =
          'Memorization Card for Knowledge: ${memoCard.knowledge};'
          ' with state: ${memoCard.state} and due at: ${memoCard.due}.';
      expect(memoCard.toString(), expectedString);
    });
  });
}
