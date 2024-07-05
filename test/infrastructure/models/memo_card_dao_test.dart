import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardService', () {
    test('alwaysTrue returns true', () {
      final memoCardDAO = MemoCardDAO();
      expect(memoCardDAO.alwaysTrue(), isTrue);
    });
  });
}