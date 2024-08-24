/// Enum that enumerates the possible learning states of [MemoCard].
enum CardState {
  /// The card has never been studied.
  newCard,

  /// The card has been studied for the first time recently.
  learning,

  /// The card has been graduated from learning state.
  review,

  /// The card has been forgotten in review state.
  relearning,
}
