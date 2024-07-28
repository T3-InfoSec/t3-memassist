import 'dart:io';

import 'package:memory_assistant/memory_assistant.dart';

final String firstLevelOption1 =
    "48c52a27aed9c85e69925c4132d71dabfbb4f89500931fbdc62393f8d87a41d0";
final String firstLevelOption2 =
    "e4194aaba55b31863701448601059117380743180332343aa31f28036177380a";

// CLI example of how to use the memo card.
void main() {
// knowledge tree with depth two and arity two.
  Map<String, dynamic> knowledgeTree = {
    "firstLevel": [firstLevelOption1, firstLevelOption2],
    "secondLevel": {
      "option1": [
        "3af2c496544250ce6e5d81718a71d7444da8354c22e1a532f1e2716796d4dfd1",
        "6cb26a11ea79cb18e9a468f9950050fefc9d3303d918dbcef1f9cb1180024c70"
      ],
      "option2": [
        "a37f389f59d9aeebe792e69c274386be7b627f689a96e804f10b22d98caa2ef1",
        "5c10776f6eaa9fae4e77b136fe2b6ed4de3e7a3dcee0f26fd1c737c390a72693"
      ],
    }
  };

  MemoCard level1MemoCard = MemoCard(knowledgeTree);
  MemoCard level2MemoCard = MemoCard(knowledgeTree);
  MemoCard level3MemoCard = MemoCard(knowledgeTree);

  List<MemoCard> memoCards = [level1MemoCard, level2MemoCard, level3MemoCard];

  print('Memorization assistant CLI example');
  print('You will be prompted to answer the cards and rate your recall.');

  for (var memoCard in memoCards) {
    reviewLevels(memoCard.knowledge);
    rateCard(memoCard);
  }

  print('Final state of cards:');
  printStates(memoCards);
}

void reviewLevels(Map<String, dynamic> tree) {
  // First level options
  List<String> firstLevelOptions =
      List<String>.from(tree["firstLevel"] as List);
  print(
      "\nL1: Please provide the correct option (1-${firstLevelOptions.length}):");
  for (var i = 0; i < firstLevelOptions.length; i++) {
    print("  ${i + 1}) ${firstLevelOptions[i]}");
  }

  int firstLevelChoice = getChoice(firstLevelOptions.length);
  String selectedFirstLevel = firstLevelOptions[firstLevelChoice - 1];
  print("Selected: $selectedFirstLevel\n");

  // Determine the second level key based on the selected first level option
  String secondLevelKey;
  if (selectedFirstLevel == firstLevelOption1) {
    secondLevelKey = "option1";
  } else if (selectedFirstLevel == firstLevelOption2) {
    secondLevelKey = "option2";
  } else {
    print("Invalid selection.");
    return;
  }

  // Second level options
  List<String> secondLevelOptions =
      List<String>.from(tree["secondLevel"][secondLevelKey] as List);
  print(
      "L2: Please provide the correct option (1-${secondLevelOptions.length}):");
  for (var i = 0; i < secondLevelOptions.length; i++) {
    print("  ${i + 1}) ${secondLevelOptions[i]}");
  }

  int secondLevelChoice = getChoice(secondLevelOptions.length);
  String selectedSecondLevel = secondLevelOptions[secondLevelChoice - 1];
  print("Selected: $selectedSecondLevel");
}

int getChoice(int max) {
  while (true) {
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? "");
    if (choice != null && choice > 0 && choice <= max) {
      return choice;
    }
    print("Invalid option. Please try again.");
  }
}

void rateCard(MemoCard card) {
  bool validRating = false;
  while (!validRating) {
    print('Rate your recall (again, hard, good, easy):');
    String userRating = stdin.readLineSync() ?? '';
    if (['again', 'hard', 'good', 'easy'].contains(userRating)) {
      card.rateCard(userRating);
      validRating = true;
      print('Card rated as $userRating.');
    } else {
      print('Invalid rating. Please enter again, hard, good, or easy.');
    }
  }
}

void printStates(List<MemoCard> cards) {
  for (var memoCard in cards) {
    print('--------------');
    print('Knowledge: ${memoCard.knowledge}');
    print('State (as int): ${memoCard.state}');
    print(
        "    0: \"newState\",\n    1: \"learning\",\n    2: \"review\",\n    3: \"relearning\"");
    print('Due: ${memoCard.due}');
  }
}
