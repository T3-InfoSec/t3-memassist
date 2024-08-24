import 'package:memory_assistant/memory_assistant.dart';

void main() {
  // knowledge tree with depth three and arity two.
  Map<String, dynamic> knowledgeTree = {
    "firstLevel": [
      "48c52a27aed9c85e69925c4132d71dabfbb4f89500931fbdc62393f8d87a41d0",
      "e4194aaba55b31863701448601059117380743180332343aa31f28036177380a"
    ],
    "secondLevel": {
      "option1": [
        "3af2c496544250ce6e5d81718a71d7444da8354c22e1a532f1e2716796d4dfd1",
        "6cb26a11ea79cb18e9a468f9950050fefc9d3303d918dbcef1f9cb1180024c70"
      ],
      "option2": [
        "a37f389f59d9aeebe792e69c274386be7b627f689a96e804f10b22d98caa2ef1",
        "5c10776f6eaa9fae4e77b136fe2b6ed4de3e7a3dcee0f26fd1c737c390a72693"
      ],
    },
    "thirdLevel": {
      "option1": [
        "4f5tc496544250ce6e5d81718a71d7444da8354c22e1a532f1e2716796d4dfd1",
        "5t67sa11ea79cb18e9a468f9950050fefc9d3303d918dbcef1f9cb1180024c70"
      ],
      "option2": [
        "b12f389f59d9aeebe792e69c274386be7b627f689a96e804f10b22d98caa2ef1",
        "aaa0776f6eaa9fae4e77b136fe2b6ed4de3e7a3dcee0f26fd1c737c390a72693"
      ],
      "option3": [
        "4rt6c496544250ce6e5d81718a71d7444da8354c22e1a532f1e2716796d4dfd1",
        "09ok8a11ea79cb18e9a468f9950050fefc9d3303d918dbcef1f9cb1180024c70"
      ],
      "option4": [
        "12e3r89f59d9aeebe792e69c274386be7b627f689a96e804f10b22d98caa2ef1",
        "4adf776f6eaa9fae4e77b136fe2b6ed4de3e7a3dcee0f26fd1c737c390a72693"
      ],
    }
  };

  MemoCard level1MemoCard = MemoCard(knowledge: knowledgeTree);
  MemoCard level2MemoCard = MemoCard(knowledge: knowledgeTree);
  MemoCard level3MemoCard = MemoCard(knowledge: knowledgeTree);

  print('Initial state of the level 1 memo card:');
  printDetails(level1MemoCard);
  print('Initial state of the level 2 memo card:');
  printDetails(level2MemoCard);
  print('Initial state of the level 3 memo card:');
  printDetails(level3MemoCard);

  // Rate the memo cards with different ratings
  print('\nRating level 1 memo card as "hard"');
  level1MemoCard.rateCard('hard');
  printDetails(level1MemoCard);

  print('\nRating level 2 memo card as "good"');
  level2MemoCard.rateCard('good');
  printDetails(level2MemoCard);

  print('\nRating level 3 memo card as "easy"');
  level3MemoCard.rateCard('easy');
  printDetails(level3MemoCard);

  print('\nRating level 1 memo card as "again"');
  level1MemoCard.rateCard('again');
  printDetails(level1MemoCard);
}

// Function to print the details of the Memo card
void printDetails(MemoCard memoCard) {
  print('--------------');
  print('Knowledge: ${memoCard.knowledge}');
  print('State (as int): ${memoCard.state}');
  print(
    '    0: "newState",\n    1: "learning",\n'
    '    2: "review",\n    3: "relearning"',
  );
  print('Due: ${memoCard.due}');
}
