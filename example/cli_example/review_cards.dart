
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:memo_assistant/src/infrastructure/repositories/hive_memo_card_repository.dart';

import 'nodes.dart';

void main() async {
  Hive.init('hive_example_directory');
  Hive.registerAdapter(MemoCardDAOAdapter());

  final dataSource = HiveMemoCardDataSource();
  await dataSource.openBox();

  final repository = HiveMemoCardRepository(dataSource);

  List<MemoCardDetails> memoCards = repository.getAllMemoCards();
  for (int level = 0; level < memoCards.length; level++) {
    MemoCardDetails memoCard = memoCards[level];
    print('Level $level of ${memoCards.length - 1}.');
    print('Card Review date is ${memoCard.due} and today is ${DateTime.now()}');
    print('Select Option:');
    for (int i = 0; i < nodes[level].length; i++) {
      print('${i + 1}). ${nodes[level][i]}');
    }
    int choice = int.parse(stdin.readLineSync()!);
    String selectedOption = nodes[level][choice - 1];
    String selectedHash = HashUtils.generateSHA256(selectedOption);

    if (selectedHash == memoCard.nodeHash) {
      print('Correct!');
    } else {
      print('Incorrect.');
    }
    MemoCard updatedCard = MemoCard(selectedOption, 'Formosa');
    
    // Rate card
    bool validRating = false;
    while (!validRating) {
      print('Rate your recall (again, hard, good, easy):');
      String userRating = stdin.readLineSync() ?? '';
      if (['again', 'hard', 'good', 'easy'].contains(userRating)) {
        updatedCard.rateCard(userRating);
        validRating = true;
        print('Card rated as $userRating.');
      } else {
        print('Invalid rating. Please enter again, hard, good, or easy.');
      }
    }

    await repository.deleteMemoCard(updatedCard); // TODO implement updateCard method in repository.
    await repository.addMemoCard(updatedCard);
  }

  await dataSource.closeBox();
  print('MemoCards reviewed and updated successfully.');
}
