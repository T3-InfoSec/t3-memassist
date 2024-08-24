import 'package:fsrs/fsrs.dart';

/// A class that represents a memorization card containing knowledge.
///
/// It uses the spaced repetition algorithm [FSRS ref](https://pub.dev/packages/fsrs)
/// to manage memorization card. It stores details of a card review that are
/// essential for the spaced repetition algorithm to optimize future review
/// schedules. It allows to to keep a record of each review session, which can
/// be useful for analyzing learning progress and patterns over time.
class MemoCard {
  final Map<String, dynamic>? _knowledge;
  final FSRS _algorithm = FSRS();
  Card _card = Card();
  ReviewLog? _log;

  /// Constructor that initializes a MemoCard with optional [knowledge].
  /// If no knowledge is provided, the default value is null.
  MemoCard([this._knowledge]);

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
    _log = schedulingCards[rates[rating]]!.reviewLog;
  }

  /// Returns the knowledge or an empty map if there is no knowledge.
  Map<String, dynamic>? get knowledge => _knowledge;

  /// [due] represents the date and time of the next card revision.
  DateTime? get due => _card.due;

  int get state => _log?.state.val ?? State.newState.val;

  @override
  String toString() {
    return 'Memorization Card for Knowledge: ${_knowledge ?? 'No Knowledge'};'
        ' with state: $state and due at: $due.';
  }
}
