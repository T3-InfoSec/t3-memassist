import 'package:test/test.dart';
import 'package:fsrs/fsrs.dart';

import 'package:memory_assistant/memory_assistant.dart';

void main() {
  group('MemoCard tests', () {

    test('Initialization test', () {
      var memCard = MemoCard(2);
      
      expect(memCard.question, 2);
      expect(memCard.correctAnswer, 'correct answer');
      expect(memCard.due, isNotNull);
      expect(memCard.state, State.newState.val);
    });

    test('Rate card test', () {
      var memCard = MemoCard(2);
      expect(memCard.state, State.newState.val);

      // First rating
      DateTime beforeFirstRate = DateTime.now().toUtc();
      memCard.rateCard('hard');
      expect(memCard.state, State.newState.val);
      expect(memCard.due!.isAfter(beforeFirstRate), isTrue);

      // Second rating
      memCard.rateCard('good');
      DateTime afterSecondRate = DateTime.now().toUtc();
      expect(memCard.state, State.learning.val);
      expect(memCard.due!.isAfter(beforeFirstRate), isTrue);

      // Third rating
      memCard.rateCard('easy');
      DateTime afterThirdRate = DateTime.now().toUtc();
      expect(memCard.state, State.review.val);
      expect(memCard.due!.isAfter(afterSecondRate), isTrue);

      // Fourth and fifth rating to trigger relearning
      memCard.rateCard('again');
      expect(memCard.state, State.review.val);
      memCard.rateCard('again');
      expect(memCard.state, State.relearning.val);
      expect(memCard.due!.isAfter(afterThirdRate), isTrue);
    });

    test('ToString test', () {
      var memCard = MemoCard(3);
      String expectedString = 'Memorization Card for node: ${memCard.question}; with state: ${memCard.state} and due at: ${memCard.due}.';
      expect(memCard.toString(), expectedString);
    });
  });
}
