import 'package:flutter/foundation.dart';
import 'package:medlike/data/models/faq_models/faq_models.dart';
import 'package:medlike/data/repository/faq_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';

part 'faq_state.dart';

class FAQCubit extends MediatorCubit<FAQState, UserMediatorEvent>
    with RefreshErrorHandler<FAQState, UserCubit> {
  FAQCubit(this.faqRepository, mediator) : super(const FAQState(), mediator) {
    mediator.register(this);
  }

  @override
  void receive(String from, UserMediatorEvent event) {
    throw UnimplementedError();
  }

  final FAQRepository faqRepository;

  /// Получает весь список
  void getFAQItemsList({required bool isRefresh}) async {
    if (state.getFAQItemsListStatus == GetFAQItemsListStatuses.loading) {
      return;
    }
    if (state.faqsList != null && state.faqsList!.isNotEmpty && !isRefresh) {
      return;
    }

    emit(state.copyWith(
      getFAQItemsListStatus: GetFAQItemsListStatuses.loading,
    ));
    try {
      final List<FAQItemModel> response;
      response = await faqRepository.getFAQList();
      emit(state.copyWith(
        getFAQItemsListStatus: GetFAQItemsListStatuses.success,
        faqsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getFAQItemsListStatus: GetFAQItemsListStatuses.failed));
    }
  }
}
