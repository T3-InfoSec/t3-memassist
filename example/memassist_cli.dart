import 'dart:io';
import 'dart:math';

import 'bit39.dart';

import 'package:memory_assistant/memory_assistant.dart';

// CLI example of how to use the memo card library.
void main() {
  List<MemoCard> cards = [
    MemoCard('moment weapon pact', 'Formosa'),
    MemoCard('bone exact certain', 'Formosa'),
    MemoCard('earth offer verb', 'Formosa'),
    MemoCard('now cause wave', 'Formosa'),
  ];

  print('Memorization assistant CLI example');
  print('You will be prompted to answer the cards and rate your recall.');

  for (var card in cards) {
    reviewCard(card);
  }

  print('Final state of cards:');
  printStates(cards);
}

void reviewCard(MemoCard card) {
  bool correctAnswer = false;

  List<String> options = [];
  options.add("${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]}");
  options.add("${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]}");
  options.add("${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]} ${BIP39.words[Random().nextInt(BIP39.words.length)]}");
  options.add(card.knowledge.toString());
  options.shuffle();

  while (!correctAnswer) {
    print('\nPlease provide the correct knowledge for the card:');
    print('\n${card.knowledgeType}');
    print('-----------------');
    for(int i = 0; i < options.length; i++) {
      print('${i + 1}. ${options[i]}');
    }
    print('Type the correct knowledge number (1-${options.length}):');
    String userAnswer = stdin.readLineSync() ?? '';

    // Validate user's answer against the correct knowledge
    int userChoice = int.tryParse(userAnswer)!;
    if (userChoice >= 1 && userChoice <= options.length) {
      if (options[userChoice - 1] == card.knowledge.toString()) {
        correctAnswer = true;
        print('Correct!');

        // Rate card
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
      } else {
        print('Incorrect. Try again.');
      }
    } else {
      print('Invalid input. Please enter a number from 1 to ${options.length}.');
    }
  }
}

void printStates(List<MemoCard> cards) {
  for (var card in cards) {
    print('--------------');
    print('Knowledge: ${card.knowledge}');
    print('State: ${card.state}');
    print('Due date: ${card.due}');
  }
}