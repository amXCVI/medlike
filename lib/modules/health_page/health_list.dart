import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health_page/health_item.dart';

class HealthList extends StatelessWidget {
  const HealthList({
    Key? key,
    required this.diariesCategoriesList
  }) : super(key: key);

  final List<DiaryCategoryModel> diariesCategoriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: diariesCategoriesList.length,
      itemBuilder: (ctx, index) {
        return HealthItem(
          iconPath: diariesCategoriesList[index].categoryImg, 
          title: diariesCategoriesList[index].name,
          data: diariesCategoriesList[index].values
        );
      }
    );
  }
}
