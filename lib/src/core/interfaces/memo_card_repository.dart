import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';

/// An abstract class that defines the repository interface for memorization cards.
abstract class MemoCardRepository {
  Future<void> addMemoCard(MemoCard card);
  Future<MemoCardDetails> getMemoCard(int key);
  List<MemoCardDetails> getAllMemoCards();
  Future<void> deleteMemoCard(MemoCard card);
}