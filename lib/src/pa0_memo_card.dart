import 'package:t3_memassist/memory_assistant.dart';

class Pa0MemoCard extends MemoCard {
  Pa0MemoCard({
    required dynamic pa0,
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
  }) : super(
          knowledge: {
            'pa0': pa0,
          },
        );

  String get pa0 => knowledge['pa0'] as String;
}
