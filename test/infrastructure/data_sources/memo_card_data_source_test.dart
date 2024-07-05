import 'package:memo_assistant/src/infrastructure/data_sources/hive_memo_card_dta_source.dart';
import 'package:test/test.dart';

void main() {
  group('MemoCardService', () {
    test('alwaysTrue returns true', () {
      final datasource = HiveMemoCardDataSource();
      expect(datasource.alwaysTrue(), isTrue);
    });
  });
}