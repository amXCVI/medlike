import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/researches_list/research_item.dart';

class ResearchesList extends StatefulWidget {
  const ResearchesList(
      {Key? key,
      required this.researchesList,
      required this.selectedResearchesIds})
      : super(key: key);

  final List<Research> researchesList;
  final List<String> selectedResearchesIds;

  @override
  State<ResearchesList> createState() => _ResearchesListState();
}

class _ResearchesListState extends State<ResearchesList> {
  void _handleTapOnResearch(Research research) {
    context.read<SubscribeCubit>().addOrRemoveSelectedResearchId(research.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: widget.researchesList
            .map((item) => MaterialButton(
                  onPressed: () {
                    _handleTapOnResearch(item);
                  },
                  child: ResearchItem(
                    researchItem: item,
                    isSelected: widget.selectedResearchesIds.contains(item.id),
                  ),
                ))
            .toList());
  }
}
