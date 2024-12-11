import 'package:t3_memassist/memory_assistant.dart';

class Sa0MemoCard extends MemoCard {
  Sa0MemoCard({
    required String encryptedSa0Mnemonic,
    required String formosaThemeName,
    required super.deck,
    super.due,
    super.lastReview,
    super.stability,
    super.difficulty,
    super.elapsedDays,
    super.scheduledDays,
    super.reps,
    super.lapses,
    super.stateIndex,
    super.id,
  }) : super(
          knowledge: {
            'encryptedSa0Mnemonic': encryptedSa0Mnemonic,
            'formosaThemeName': formosaThemeName
          },
          title: 'Input Password Card',
        );

  String get encryptedSa0Mnemonic => knowledge['encryptedSa0Mnemonic'];

  String get formosaThemeName => knowledge['formosaThemeName'];
}
