import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_page/diary_chips.dart';
import 'package:medlike/modules/health/diary_page/diary_skeleton.dart';
import 'package:medlike/modules/health/diary_page/diary_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({
    Key? key,
    required this.title,
    required this.categoryModel
  }) : super(key: key);

  final String title;
  final DiaryCategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        Widget page; 

        if(state.getDiaryStatuses == GetDiaryStatuses.failed) {
          page = const Text('');
        } else if(state.getDiaryStatuses == GetDiaryStatuses.loading 
          || state.selectedDiary == null) {
          page = const DiarySkeleton();
        } else  {
          page = DiaryView(
            diaryModel: state.selectedDiary!,
            decimalDigits: categoryModel.decimalDigits,
            measureItem: categoryModel.measureItem,
          );
        }
        return DefaultScaffold(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                if(state.selectedDiary != null) DiaryChips(syn: state.selectedDiary!.syn),
                page,
              ],
            ),
          ),
          appBarTitle: title,
        );
      },
    );
  }
}
