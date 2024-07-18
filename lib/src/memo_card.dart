import 'package:fsrs/fsrs.dart';

/// A class that represents a memorization card containing [question] node level and [answer]
/// using the spaced repetition algorithm fsrs: https://pub.dev/packages/fsrs
/// [ReviewLog] stores details of a card review that are essential for the spaced repetition
/// algorithm to optimize future review schedules. It allows us to to keep a record of each review session, 
/// which can be useful for analyzing learning progress and patterns over time.
class MemoCard {
  final int _question;
  final String _answer = "correct answer"; // Not implemented yet see: https://github.com/T3-InfoSec/t3-memassist/issues/10
  final FSRS _algorithm = FSRS();
  Card _card = Card();
  ReviewLog? _log;

  /// Initialization of a new MemoCard with the given [question].
  MemoCard(this._question);

  /// Rates the card knowledge and updates its state and review log.
  /// The [rating] parameter can take the values 'again', 'hard', 'good', and 'easy'.
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
    _log = schedulingCards[rates[rating]]!.reviewLog;
  }

  /// Getters
  int get question => _question;
  String get correctAnswer => _answer;
  /// [due] represents the date and time of the next card revision.
  DateTime? get due => _card.due;
  int get state => _log?.state.val ?? State.newState.val;

  @override
  String toString() {
    return 'Memorization Card for node: $_question; with state: $state and due at: $due.';
  }
}
