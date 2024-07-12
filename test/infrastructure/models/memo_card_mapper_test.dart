import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_mapper.dart';
import 'package:test/test.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

void main() {
  group('MemoCardMapper Tests', () {
    test('toDAO should map MemoCard to MemoCardDAO correctly', () {
      String knowledgeNode = 'sample knowledge node';
      MemoCard memoCard = MemoCard(knowledgeNode);

      MemoCardDAO dao = MemoCardMapper.toDAO(memoCard);

      expect(dao.nodeHash, equals(HashUtils.generateSHA256(knowledgeNode)));
      expect(dao.due, isNotNull);
    });




    test('toEntity should map MemoCardDAO to MemoCardDetails correctly', () {
      String nodeHash = HashUtils.generateSHA256('sample knowledge');
      DateTime due = DateTime(2024, 7, 9);
      MemoCardDAO dao = MemoCardDAO(nodeHash, due);

      MemoCardDetails memoCardDetails = MemoCardMapper.toEntity(dao);

      expect(memoCardDetails.nodeHash, equals(nodeHash));
      expect(memoCardDetails.due, equals(due));
    });
  });
}
