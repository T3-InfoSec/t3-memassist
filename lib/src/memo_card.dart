import 'package:fsrs/fsrs.dart';

import 'memo_card_state.dart';

/// A memorization card that can contain and manage knowledge.
///
/// It uses the spaced repetition algorithm [FSRS ref](https://pub.dev/packages/fsrs)
/// to manage memorization card. It stores details of a card review that are
/// essential for the spaced repetition algorithm to optimize future review
/// schedules. It allows to to keep a record of each review session, which can
/// be useful for analyzing learning progress and patterns over time.
class MemoCard {
  final dynamic _knowledge;
  final FSRS _algorithm = FSRS();
  Card _card = Card();

  /// Constructor that initializes a MemoCard with optional [knowledge].
  /// If no knowledge is provided, the default value is null.
  MemoCard({required knowledge}) : _knowledge = knowledge;

  /// The date and time for next revision time of [MemoCard].
  DateTime get due => _card.due;

  /// The knowledge that is maintained by [MemoCard].
  dynamic get knowledge => _knowledge;

  /// Returns the learning state of [MemoCard].
  ///
  /// The [newCard] state means the card has never been studied, [learning]
  /// means the card has been studied for the first time recently, [review]
  /// means the card has been graduated from learning state, [relearning]
  /// means the card has been forgotten in review state.
  CardState get state {
    switch (_card.state) {
      case State.newState:
        return CardState.newCard;
      case State.learning:
        return CardState.learning;
      case State.review:
        return CardState.review;
      case State.relearning:
        return CardState.relearning;
    }
  }

  /// Rates the card knowledge and updates its state and review log.
  ///
  /// The [rating] parameter can take the values 'again', 'hard', 'good',
  /// and 'easy'.
  void rateCard(String rating) {
    DateTime now = DateTime.now().toUtc();
    Map<String, Rating> rates = {
      "again": Rating.again,
      "hard": Rating.hard,
      "good": Rating.good,
      "easy": Rating.easy,
    };

    var schedulingCards = _algorithm.repeat(_card, now);
    _card = schedulingCards[rates[rating]]!.card;
  }

  @override
  String toString() {
    return 'Memorization Card for Knowledge: $_knowledge;'
        ' with state: $state and due at: $due.';
  }
}
