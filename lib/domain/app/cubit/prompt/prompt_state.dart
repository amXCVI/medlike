part of 'prompt_cubit.dart';

enum PromptStatuses { unselected, selected }

class PromptState {
  final PromptStatuses? promptStatuses;
  final int? selectedId;

  PromptState({
    this.promptStatuses,
    this.selectedId
  });

  PromptState copyWith({
    PromptStatuses? promptStatuses,
    int? selectedId
  }) {
    return PromptState(
      promptStatuses: promptStatuses ?? this.promptStatuses,
      selectedId: selectedId ?? this.selectedId
    );
  }
}
