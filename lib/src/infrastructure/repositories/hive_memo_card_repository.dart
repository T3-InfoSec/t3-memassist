import 'package:memo_assistant/src/core/interfaces/memo_card_repository.dart';

class HiveMemoCardRepository implements MemoCardRepository {
  
  bool alwaysTrue() {
    return true;
  }
}