class MemoCardDetails {
  final String _nodeHash;
  final DateTime _due;

  /// Initialization of a new MemoCardDetails with the given [nodeHash] and [due].
  MemoCardDetails(this._nodeHash, this._due);

  /// Getters
  String get nodeHash => _nodeHash;

  /// [due] represents the date and time of the next card revision.
  DateTime get due => _due;

  @override
  String toString() {
    return 'Memorization Card details: $_nodeHash, and due at: $due.';
  }
}
