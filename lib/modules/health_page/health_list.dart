import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health_page/health_item.dart';

class HealthList extends StatelessWidget {
  const HealthList({
    Key? key,
    required this.diariesCategoriesList,
    required this.diariesItems
  }) : super(key: key);

  final List<DiaryCategoryModel> diariesCategoriesList;
  final List<DiaryModel> diariesItems;

  @override
  Widget build(BuildContext context) {
    DiaryModel? getDiaryEntries(int index) {
      for(int i = 0; i < diariesItems.length; i++) {
        if(diariesItems[i].syn == diariesCategoriesList[index].synonim) {
          return diariesItems[i];
        }
      }

      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: diariesCategoriesList.length,
        itemBuilder: (ctx, index) {
          return HealthItem(
            iconPath: diariesCategoriesList[index].categoryImg, 
            title: diariesCategoriesList[index].name,
            measureItem: diariesCategoriesList[index].measureItem,
            decimalDigits: diariesCategoriesList[index].decimalDigits,
            data: getDiaryEntries(index)
          );
        }
      ),
    );
  }
}
