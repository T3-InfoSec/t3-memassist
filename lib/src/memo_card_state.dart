/// Enum that enumerates the possible learning states of [MemoCard].
enum CardState {
  /// A card state in which the card has never been studied.
  newCard,

  /// A card state in which the card has been studied for the first time recently.
  learning,

  /// A card state in which the card has been graduated from learning state.
  review,

  /// A card state in which the card has been forgotten in review state.
  relearning,
}
