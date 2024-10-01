import 'package:t3_hashviz/hashviz.dart';
import 'package:t3_memassist/memory_assistant.dart';

void main() {
  // Create an instance of Hashviz
  final hashviz =
      Hashviz(hashToVisualize: 'example_to_hash', visualizationSize: 16);

  // Generate and retrieve the image data
  final knowledgeToMemorize = hashviz.visualizationBlocks;

  // Create an instance of MemoCard
  MemoCard memoCard = MemoCard(knowledge: knowledgeToMemorize);

  print('Initial state of the memo card:');
  printDetails(memoCard);

  // Rate the memo cards with different ratings
  print('\nRating level 1 memo card as "hard"');
  memoCard.rateCard('hard');
  printDetails(memoCard);

  print('\nRating level 2 memo card as "good"');
  memoCard.rateCard('good');
  printDetails(memoCard);

  print('\nRating level 3 memo card as "easy"');
  memoCard.rateCard('easy');
  printDetails(memoCard);

  print('\nRating level 1 memo card as "again"');
  memoCard.rateCard('again');
  printDetails(memoCard);
}

// Function to print the details of the Memo card
void printDetails(MemoCard memoCard) {
  print('--------------');
  print('Knowledge: ${memoCard.knowledge}');
  print('State: ${memoCard.state}');
  print('Due: ${memoCard.due}');
}
