part of 'prompt_cubit.dart';

enum PromptStatuses { unselected, selected }

class PromptState {
  final PromptStatuses? promptStatuses;

  PromptState({
    this.promptStatuses,
  });

  PromptState copyWith({
    PromptStatuses? promptStatuses
  }) {
    return PromptState(
      promptStatuses: promptStatuses ?? this.promptStatuses
    );
  }
}
