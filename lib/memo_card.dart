import 'package:fsrs/fsrs.dart';

// TODO Improve documentation comments

/// A class that represents a memorization card containig knowledge using a spaced repetition algorithm.
class MemoCard {
  final dynamic knowledge;
  final dynamic knowledgeType;
  FSRS _algorithm;
  Card _card;
  ReviewLog? _log;

  /// Inizialization of a new MemoCard with the given knowledge and knowledge type.
  MemoCard(this.knowledge, this.knowledgeType) {
    _algorithm = FSRS();
    _card = Card();
    _log = null;
  }

  /// Rates the card knowledge and updates its state and review log.
  ///
  /// The [rating] parameter can take the values 'again', 'hard', 'good', and 'easy'.
  void rateCard(String rating) {
    DateTime now = DateTime.now().toUtc();
    Map<String, Rating> rates = {
      "again": Rating.again,
      "hard": Rating.hard,
      "good": Rating.good,
      "easy": Rating.easy,
    };

    // Repeat the card using the spaced repetition algorithm.
    var schedulingCards = _algorithm.repeat(_card, now);
     // Get the new state of card for each rating:
    _card = schedulingCards[rates[rating]]!.card;
    // Get the review log after rating `Good`:
    _log = schedulingCards[rates[rating]]!.reviewLog;
  }

  /// getters
  dynamic get knowledge => knowledge;
  dynamic get knowledgeType => knowledgeType;
  DateTime? get due => _card.due;
  int get state => _log?.state ?? State.New;

  @override
  String toString() {
    return 'Memorization Card for Knowledge: $knowledge; with state: $state and due at: $due.';
  }

// TODO: Review necesity of repr method
//  String repr() {
//    String className = runtimeType.toString();
//    return '$className(knowledge: $knowledge)';
//  }
}