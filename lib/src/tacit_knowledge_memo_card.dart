import 'package:t3_memassist/memory_assistant.dart';

class TacitKnowledgeMemoCard extends MemoCard {
  TacitKnowledgeMemoCard({
    required super.knowledge,
    required super.deck,
    super.title,
    super.due,
    super.lastReview,
    super.stability,
    super.difficulty,
    super.elapsedDays,
    super.scheduledDays,
    super.reps,
    super.lapses,
    super.stateIndex,
  });
}
