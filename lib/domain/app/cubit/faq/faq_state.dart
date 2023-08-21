part of 'faq_cubit.dart';

enum GetFAQItemsListStatuses { initial, loading, success, failed }

@immutable
class FAQState {
  final GetFAQItemsListStatuses? getFAQItemsListStatus;
  final List<FAQItemModel>? faqsList;

  const FAQState({
    this.getFAQItemsListStatus = GetFAQItemsListStatuses.initial,
    this.faqsList,
  });

  FAQState copyWith({
    GetFAQItemsListStatuses? getFAQItemsListStatus,
    List<FAQItemModel>? faqsList,
  }) {
    return FAQState(
      getFAQItemsListStatus:
          getFAQItemsListStatus ?? this.getFAQItemsListStatus,
      faqsList: faqsList ?? this.faqsList,
    );
  }

  List<Object?> get props => [];
}
