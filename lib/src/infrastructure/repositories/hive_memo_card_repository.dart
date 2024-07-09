import 'package:memo_assistant/src/core/entities/memo_card.dart';
import 'package:memo_assistant/src/core/entities/memo_card_details.dart';
import 'package:memo_assistant/src/core/interfaces/memo_card_repository.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_mapper.dart';

class HiveMemoCardRepository implements MemoCardRepository {

  final HiveMemoCardDataSource dataSource;

  HiveMemoCardRepository(this.dataSource);

  @override
  Future<void> addMemoCard(MemoCard card) async {
    MemoCardDAO cardDAO = MemoCardMapper.toDAO(card);
    await dataSource.addMemoCard(cardDAO);
  }

  @override
  List<MemoCardDetails> getAllMemoCards() {
    List<MemoCardDAO> getAllMemoCardDAOs = dataSource.getAllMemoCards();
    List<MemoCardDetails> cardDetailsResult = [];
    for (MemoCardDAO dao in getAllMemoCardDAOs) {
      cardDetailsResult.add(MemoCardMapper.toEntity(dao));
    }
    return cardDetailsResult;
  }

  @override
  Future<MemoCardDetails> getMemoCard(int key) async {
    MemoCardDAO? dao = await dataSource.getMemoCard(key);
    
    if (dao == null) {
      throw Exception('MemoCardDetails not found'); // TODO implement execption management.
    }

    return MemoCardMapper.toEntity(dao);
  }

    @override
  Future<void> deleteMemoCard(MemoCard card) async {
    await dataSource.deleteMemoCard(MemoCardMapper.toDAO(card));
  }

}