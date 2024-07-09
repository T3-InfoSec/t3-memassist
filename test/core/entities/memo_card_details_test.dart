import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardDetails', () {
    test('should correctly initialize with given values', () {
      String nodeHash = 'sampleNodeHash';
      DateTime due = DateTime(2024, 7, 9);

      MemoCardDetails memoCardDetails = MemoCardDetails(nodeHash, due);

      expect(memoCardDetails.nodeHash, equals(nodeHash));
      expect(memoCardDetails.due, equals(due));
    });

    test('should return correct string representation', () {
      String nodeHash = 'sampleNodeHash';
      DateTime due = DateTime(2024, 7, 9);
      MemoCardDetails memoCardDetails = MemoCardDetails(nodeHash, due);

      String result = memoCardDetails.toString();

      expect(result, equals('Memorization Card details: sampleNodeHash, and due at: 2024-07-09 00:00:00.000.'));
    });
  });
}
