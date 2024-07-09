
import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

class MemoCardMapper {
  static MemoCardDAO toDAO(MemoCard memoCard) {
    return MemoCardDAO(
      HashUtils.generateSHA256(memoCard.knowledge.toString()),
      memoCard.due,
    );
  }

  static MemoCardDetails toEntity(MemoCardDAO dao) {
    MemoCardDetails memoCardDetails = MemoCardDetails(dao.nodeHash, dao.due!);
    return memoCardDetails;
  }
}