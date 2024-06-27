import 'package:fsrs/fsrs.dart';
import 'package:memo_assistant/memassist.dart';

void main() {
  // Create an array of MemoCard objects with different knowledge items
  List<MemoCard> cards = [
    MemoCard('moment weapon pact', 'Formosa'),
    MemoCard('bone exact certain', 'Formosa'),
    MemoCard('earth offer verb', 'Formosa'),
    MemoCard('now cause wave', 'Formosa'),
  ];

  print('Initial state of cards:');
  printStates(cards);

  // Rate all cards with different ratings
  print('\nRating first card as "easy"');
  cards[0].rateCard('easy');
  cards[0].rateCard('easy');

  print('\nRating second card as "good"');
  cards[1].rateCard('good');
  cards[1].rateCard('good');

  print('\nRating third card as "good"');
  cards[2].rateCard('good');
  cards[2].rateCard('good');
  cards[2].rateCard('good');
  

  print('\nRating forth card as "hard"');
  cards[3].rateCard('hard');
  cards[3].rateCard('hard');

  print('Final state of cards:');
  printStates(cards);

}

State? fromValue(int value) {
  for (var state in State.values) {
    if (state.val == value) {
      return state;
    }
  }
  return null;
}

void printStates(List<MemoCard> cards) {
  print('');
  for (var card in cards) {
    print('--------------');
    print(card.knowledge);
    print(fromValue(card.state)!);
    print(card.due!);
  }
}
