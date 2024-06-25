import 'package:test/test.dart';
import 'package:fsrs/fsrs.dart';
import 'package:memo_assistant/memo_card.dart';

void main() {
  group('MemoCard tests', () {
    late MemoCard card;

    test('Initialization test', () {
    var memCard = MemoCard('Test Knowledge', 'Test Type');
    
    expect(memCard.knowledge, 'Test Knowledge');
    expect(memCard.knowledgeType, 'Test Type');
    expect(memCard.due, isNotNull);
    expect(memCard.state, State.newState.val);
    });

    test('Rate card test', () {
      var memCard = MemoCard('Test Knowledge', 'Test Type');
      expect(memCard.state, State.newState.val);

      // First rating
      DateTime beforeFirstRate = DateTime.now().toUtc();
      memCard.rateCard('hard');
      DateTime afterFirstRate = DateTime.now().toUtc();
      expect(memCard.state, State.newState.val);
      expect(memCard.due!.isAfter(beforeFirstRate), isTrue);

      // Second rating
      memCard.rateCard('good');
      DateTime afterSecondRate = DateTime.now().toUtc();
      expect(memCard.state, State.learning.val);
      expect(memCard.due!.isAfter(afterFirstRate), isTrue);

      // Third rating
      memCard.rateCard('easy');
      DateTime afterThirdRate = DateTime.now().toUtc();
      expect(memCard.state, State.review.val);
      expect(memCard.due!.isAfter(afterSecondRate), isTrue);

      // Fourth rating to trigger relearning
      memCard.rateCard('again');
      // expect(memCard.state, State.relearning.val); // TODO review how to trigger relearning
    
    });

    test('ToString test', () {
      var memCard = MemoCard('Test Knowledge', 'Test Type');
      String expectedString = 'Memorization Card for Knowledge: Test Knowledge; with state: ${memCard.state} and due at: ${memCard.due}.';
      expect(memCard.toString(), expectedString);
    });
  });
}