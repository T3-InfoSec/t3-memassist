import 'package:hive/hive.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';

class HiveMemoCardDataSource {

  late final Box<MemoCardDAO> _box;

  Box<MemoCardDAO> get box => _box;

  Future<void> openBox() async {
    _box = await Hive.openBox<MemoCardDAO>('memoCards');
  }

  Future<void> addMemoCard(MemoCardDAO card) async {
    await _box.add(card);
  }

    Future<MemoCardDAO?> getMemoCard(int key) async {
    return _box.get(key);
  }

  List<MemoCardDAO> getAllMemoCards() {
    var box = Hive.box<MemoCardDAO>('memoCards');
    return box.values.toList();
  }

  Future<void> deleteMemoCard(MemoCardDAO card) async {
    var box = Hive.box<MemoCardDAO>('memoCards');
    await box.delete(card.key);
  }

  Future<void> closeBox() async {
    await _box.close();
  }
  
}