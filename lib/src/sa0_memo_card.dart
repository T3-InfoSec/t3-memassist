import 'package:t3_memassist/memory_assistant.dart';

class Sa0MemoCard extends MemoCard {
  Sa0MemoCard({
    required dynamic encryptedSa0,
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
            'encryptedSa0': encryptedSa0,
          },
          title: 'Input Password Card',
        );

  String get encryptedSa0 => knowledge['encryptedSa0'] as String;
}
