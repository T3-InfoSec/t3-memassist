import 'package:memo_assistant/src/core/entities/memo_card.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/interfaces/memo_card_repository.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_mapper.dart';

/// A repository implementation for handling memorization cards using Hive as the data source.
class HiveMemoCardRepository implements MemoCardRepository {

  final HiveMemoCardDataSource dataSource;

  /// Creates an instance of [HiveMemoCardRepository] with the given [dataSource].
  HiveMemoCardRepository(this.dataSource);

  /// Adds a new memorization card to the repository.
  ///
  /// Converts the [MemoCard] to a [MemoCardDAO] and saves it using the data source.
  @override
  Future<void> addMemoCard(MemoCard card) async {
    MemoCardDAO cardDAO = MemoCardMapper.toDAO(card);
    await dataSource.addMemoCard(cardDAO);
  }

  /// Retrieves all memorization cards from the repository.
  ///
  /// Converts all [MemoCardDAO] objects to [MemoCardDetails] and returns them as a list.
  @override
  List<MemoCardDetails> getAllMemoCards() {
    List<MemoCardDAO> getAllMemoCardDAOs = dataSource.getAllMemoCards();
    List<MemoCardDetails> cardDetailsResult = [];
    for (MemoCardDAO dao in getAllMemoCardDAOs) {
      cardDetailsResult.add(MemoCardMapper.toEntity(dao));
    }
    return cardDetailsResult;
  }

  /// Retrieves a memorization card from the repository by its key.
  ///
  /// Takes an [int] key as input, converts the retrieved [MemoCardDAO] to [MemoCardDetails], and returns it.
  /// Throws an exception if the card is not found.
  @override
  Future<MemoCardDetails> getMemoCard(int key) async {
    MemoCardDAO? dao = await dataSource.getMemoCard(key);
    
    if (dao == null) {
      throw Exception('MemoCardDetails not found'); // TODO implement execption management.
    }

    return MemoCardMapper.toEntity(dao);
  }

  /// Deletes a memorization card from the repository.
  ///
  /// Converts the [MemoCard] to a [MemoCardDAO] and deletes it using the data source.
  @override
  Future<void> deleteMemoCard(MemoCard card) async {
    await dataSource.deleteMemoCard(MemoCardMapper.toDAO(card));
  }

}