import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';

abstract class MemoCardRepository {
  Future<void> addMemoCard(MemoCard card);
  Future<MemoCardDetails> getMemoCard(int key);
  List<MemoCardDetails> getAllMemoCards();
  Future<void> deleteMemoCard(MemoCard card);
}