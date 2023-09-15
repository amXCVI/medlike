import 'package:bloc/bloc.dart';
import 'package:html/dom_parsing.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit() : super(TourState());

  Map<TourChecked, bool> _generateDefaultChecked() =>
      {for (TourChecked item in TourChecked.values) item: false};

  void checkItem(TourChecked checked) async {
    Map<TourChecked, bool> tc = state.tourChecked ?? _generateDefaultChecked();
    emit(state.copyWith(fetched: true));
    tc[checked] = true;

    emit(state.copyWith(
      tourChecked: tc,
    ));
    await UserSecureStorage.setField(checked.toString(), "true");
  }

  void fetchStatus() async {
    // Fetching statuses for all fields
    for (TourChecked item in TourChecked.values) {
      String? itemStatus = await UserSecureStorage.getField(item.toString());
      if (itemStatus == null) continue;
      if (itemStatus != "true") continue;
      checkItem(item);
    }
    emit(state.copyWith(fetched: true));
  }
}
