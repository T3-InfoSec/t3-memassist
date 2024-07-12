
import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/utils/hash_utils.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

/// A mapper class for converting between 
/// [MemoCard] and [MemoCardDAO] objects and
/// [MemoCardDAO] and [MemoCardDetails] objects
class MemoCardMapper {

  /// Converts a [MemoCard] to a [MemoCardDAO].
  ///
  /// Takes a [MemoCard] as input and returns a [MemoCardDAO].
  static MemoCardDAO toDAO(MemoCard memoCard) {
    return MemoCardDAO(
      HashUtils.generateSHA256(memoCard.node.toString()),
      memoCard.due,
    );
  }

  /// Converts a [MemoCardDAO] to a [MemoCardDetails].
  ///
  /// Takes a [MemoCardDAO] as input and returns a [MemoCardDetails].
  static MemoCardDetails toEntity(MemoCardDAO dao) {
    MemoCardDetails memoCardDetails = MemoCardDetails(dao.nodeHash, dao.due!);
    return memoCardDetails;
  }
}