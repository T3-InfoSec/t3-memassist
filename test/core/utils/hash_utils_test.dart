import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:test/test.dart';

void main() {
  group('HashUtils', () {
    test('should generate a valid SHA-256 hash', () {
      var input = 'example knowledge node';
      var expectedHash = '7a3c02cbf13927ca5056c4d25efb6a3493fe1ca0f61fdf8dff5ebe5c8c1df608';

      var result = HashUtils.generateSHA256(input);

      expect(result, expectedHash);
    });

    test('should generate different hashes for different inputs', () {
      var input1 = 'example knowledge node';
      var input2 = 'different knowledge node';

      var hash1 = HashUtils.generateSHA256(input1);
      var hash2 = HashUtils.generateSHA256(input2);

      expect(hash1, isNot(hash2));
    });

    test('should generate same hash for same input', () {
      var input = 'consistent input';

      var hash1 = HashUtils.generateSHA256(input);
      var hash2 = HashUtils.generateSHA256(input);

      expect(hash1, hash2);
    });
  });
}
