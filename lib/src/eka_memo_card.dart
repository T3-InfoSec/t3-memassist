import 'package:t3_memassist/memory_assistant.dart';

class EkaMemoCard extends MemoCard {
  EkaMemoCard({
    required dynamic eka,
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
            'eka': eka,
          },
          title: 'Ephemeral Recovery Key Card',
        );
}