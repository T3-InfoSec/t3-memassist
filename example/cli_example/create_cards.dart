
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:memo_assistant/memassist.dart';
import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:memo_assistant/src/infrastructure/models/memo_card_dao.dart';
import 'package:memo_assistant/src/infrastructure/repositories/hive_memo_card_repository.dart';

import 'nodes.dart';

void main() async {
  Hive.init('hive_example_directory');
  Hive.registerAdapter(MemoCardDAOAdapter());

  final dataSource = HiveMemoCardDataSource();
  await dataSource.openBox();

  final repository = HiveMemoCardRepository(dataSource);

  for (int i = 0; i < nodes.length; i++) {
    print('Level $i of ${nodes.length - 1}.');
    print('Select option:');
    for (int j = 0; j < nodes[i].length; j++) {
      print('${j+1}. ${nodes[i][j]}');
    }
    int choice = int.parse(stdin.readLineSync()!);
    String selectedOption = nodes[i][choice-1];
    MemoCard card = MemoCard(selectedOption, 'Formosa');
    await repository.addMemoCard(card);
  }

  await dataSource.closeBox();
  print('MemoCards stored successfully.');
}
