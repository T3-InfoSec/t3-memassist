import 'package:hive/hive.dart';

part 'memo_card_dao.g.dart';

/// A Hive data object class for storing details of a memorization card.
///
/// This class is used to serialize and deserialize memorization card details
/// into the Hive database.
///
/// The necessary adapter file `memo_card_dao.g.dart` is already included in the repository.
/// However, if you make changes to this class, you need to regenerate the adapter file.
/// To generate the necessary files for Hive to work with this class, run:
/// `dart run build_runner build`
///
/// This command will generate the `memo_card_dao.g.dart` file which contains
/// the adapter necessary for Hive to properly handle this data object.
@HiveType(typeId: 0)
class MemoCardDAO extends HiveObject {
  @HiveField(0)
  String nodeHash;

  @HiveField(1)
  DateTime? due;

  /// Creates an instance of [MemoCardDAO] with the given [nodeHash] and [due].
  MemoCardDAO(this.nodeHash, this.due);
}