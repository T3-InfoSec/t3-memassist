import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

/// A data source class for handling operations with Hive database for memorization cards.
class HiveMemoCardDataSource {

  late final Box<MemoCardDAO> _box;

  /// Provides access to the Hive box containing [MemoCardDAO] instances.
  Box<MemoCardDAO> get box => _box;

  /// Opens the Hive box for storing memorization cards.
  Future<void> openBox() async {
    _box = await Hive.openBox<MemoCardDAO>('memoCards');
  }

  /// Adds a new memorization card to the Hive box.
  ///
  /// Takes a [MemoCardDAO] as input and adds it to the box.
  Future<void> addMemoCard(MemoCardDAO card) async {
    await _box.add(card);
  }

  /// Retrieves a memorization card from the Hive box by its key.
  ///
  /// Takes an [int] key as input and returns a [Future] of [MemoCardDAO].
  Future<MemoCardDAO?> getMemoCard(int key) async {
    return _box.get(key);
  }

  /// Retrieves all memorization cards from the Hive box.
  ///
  /// Returns a [List] of [MemoCardDAO].
  List<MemoCardDAO> getAllMemoCards() {
    var box = Hive.box<MemoCardDAO>('memoCards');
    return box.values.toList();
  }

  /// Deletes a memorization card from the Hive box.
  ///
  /// Takes a [MemoCardDAO] as input and deletes it from the box.
  Future<void> deleteMemoCard(MemoCardDAO card) async {
    var box = Hive.box<MemoCardDAO>('memoCards');
    await box.delete(card.key);
  }

  /// Closes the Hive box.
  Future<void> closeBox() async {
    await _box.close();
  }
  
}