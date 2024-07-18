import 'package:memory_assistant/memory_assistant.dart';

void main() {
  // Create a MemoCard object with question node number
  MemoCard card = MemoCard(2);

  print('Initial state of the card:');
  printDetails(card);

  // Rate the card with different ratings
  print('\nRating the card as "hard"');
  card.rateCard('hard');
  printDetails(card);

  print('\nRating the card as "good"');
  card.rateCard('good');
  printDetails(card);

  print('\nRating the card as "easy"');
  card.rateCard('easy');
  printDetails(card);

  print('\nRating the card as "again"');
  card.rateCard('again');
  printDetails(card);
}

// Function to print the details of the card
void printDetails(MemoCard card) {
  print('--------------');
  print('Node level: ${card.question}');
  print('Knowledge: ${card.correctAnswer}');
  print('State (as int): ${card.state}');
  print('Due: ${card.due}');
}
