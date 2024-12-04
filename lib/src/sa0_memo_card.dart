import 'package:t3_memassist/memory_assistant.dart';

class Sa0MemoCard extends MemoCard {
  Sa0MemoCard({
    required dynamic sa0,
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
            'sa0': sa0,
          },
          title: 'Input Password Card',
        );

  String get sa0 => knowledge['sa0'] as String;
}
