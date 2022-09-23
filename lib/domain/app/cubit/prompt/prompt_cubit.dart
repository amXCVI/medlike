import 'package:bloc/bloc.dart';

part 'prompt_state.dart';

class PromptCubit extends Cubit<PromptState> {
  PromptCubit() : super(PromptState());

  void select({
    int? selectedId 
  }) {
    emit(state.copyWith(
      promptStatuses: PromptStatuses.selected,
      selectedId: selectedId
    ));
  }

  void unselect() {
    emit(state.copyWith(
      promptStatuses: PromptStatuses.unselected
    ));
  }
}
