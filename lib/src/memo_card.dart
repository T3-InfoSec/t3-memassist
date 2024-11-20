import 'package:fsrs/fsrs.dart';
import 'package:t3_memassist/src/deck.dart';

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
  final String _title;
  final Deck _deck;
  String _id;

  /// Constructor that initializes a MemoCard with [knowledge].
  /// And optionally with card details.
  ///
  /// If these fields are not provided, the default values of [Card] will be used.
  MemoCard({
    required dynamic knowledge,
    required Deck deck,
    DateTime? due,
    DateTime? lastReview,
    double stability = 0,
    double difficulty = 0,
    int elapsedDays = 0,
    int scheduledDays = 0,
    int reps = 0,
    int lapses = 0,
    int stateIndex = 0, // new State
    String title = 'Empty title',
    String id = '',
  })  : _knowledge = knowledge,
        _deck = deck,
        _title = title,
        _id = id,
        _card = Card.def(
          due ?? DateTime.now().add(Duration(minutes: 1)).toUtc(),
          lastReview ?? DateTime.now().toUtc(),
          stability,
          difficulty,
          elapsedDays,
          scheduledDays,
          reps,
          lapses,
          State.values[stateIndex],
        );

  /// The date and time for next revision time of [MemoCard].
  DateTime get due => _card.due;

  /// The knowledge that is maintained by [MemoCard].
  dynamic get knowledge => _knowledge;

  /// The title of the [MemoCard]
  String get title => _title;

  /// The deck the [MemoCard] belongs to
  Deck get deck => _deck;

  Card get card {
    return _card;
  }

  set card(Card card) {
    _card = card;
  }

  /// The id to identify the [MemoCard]
  String get id => _id;

  set id(String id) {
    _id = id;
  }

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
