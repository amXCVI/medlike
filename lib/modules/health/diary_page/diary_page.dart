import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_page/diary_skeleton.dart';
import 'package:medlike/modules/health/diary_page/diary_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({
    Key? key,
    required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        Widget page; 

        if(state.getDiaryStatuses == GetDiaryStatuses.failed) {
          page = const Text('');
        } else if(state.getDiaryStatuses == GetDiaryStatuses.loading) {
          page = const DiarySkeleton();
        } else  {
          page = DiaryView(diaryModel: state.selectedDiary!);
        }
        return DefaultScaffold(
          child: page,
          appBarTitle: title,
        );
      },
    );
  }
}
