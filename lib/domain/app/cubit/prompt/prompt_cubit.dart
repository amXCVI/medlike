import 'package:bloc/bloc.dart';

part 'prompt_state.dart';

class PromptCubit extends Cubit<PromptState> {
  PromptCubit() : super(PromptState());

  void select() {
    emit(state.copyWith(
      promptStatuses: PromptStatuses.selected
    ));
  }

  void unselect() {
    emit(state.copyWith(
      promptStatuses: PromptStatuses.unselected
    ));
  }
}
