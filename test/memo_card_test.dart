import 'package:t3_memassist/memory_assistant.dart';
import 'package:test/test.dart';

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
      expect(memoCard.state, CardState.newCard);
    });

    test('Rate card test', () {
      var memoCard = MemoCard(
        knowledge: {
          "test": ["knowledge"]
        },
      );
      expect(memoCard.state, CardState.newCard);

      // First rating
      DateTime beforeFirstRate = DateTime.now().toUtc();
      memoCard.rateCard('hard');
      DateTime afterFirstRate = DateTime.now().toUtc();
      expect(memoCard.state, CardState.learning);
      expect(memoCard.due.isAfter(beforeFirstRate), isTrue);

      // Second rating
      memoCard.rateCard('good');
      DateTime afterSecondRate = DateTime.now().toUtc();
      expect(memoCard.state, CardState.review);
      expect(memoCard.due.isAfter(afterFirstRate), isTrue);

      // Third rating
      memoCard.rateCard('easy');
      DateTime afterThirdRate = DateTime.now().toUtc();
      expect(memoCard.state, CardState.review);
      expect(memoCard.due.isAfter(afterSecondRate), isTrue);

      // Fourth and fifth rating to trigger relearning
      memoCard.rateCard('again');
      expect(memoCard.state, CardState.relearning);
      memoCard.rateCard('again');
      expect(memoCard.state, CardState.relearning);
      expect(memoCard.due.isAfter(afterThirdRate), isTrue);
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
