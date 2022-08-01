// import 'package:flutter/material.dart';
// import 'package:medlike/data/models/medcard_models/medcard_models.dart';
// import 'package:medlike/themes/colors.dart';
//
// class MedcardFiltersList {
//   static List<MedcardFiltersItem> medcardFiltersList = [
//     MedcardFiltersItem(
//       label: 'Период',
//       filters: MedcardFilters.filterDatesList,
//     ),
//     MedcardFiltersItem(
//       label: 'Категория',
//       filters: MedcardFilters.filterCategoryList,
//     ),
//   ];
// }
//
// class MedcardFiltersItem {
//   final String label;
//   final List<MedcardFiltersItemModel> filters;
//
//   MedcardFiltersItem({required this.label, required this.filters});
// }
//
// class MedcardFilters {
//   static List<MedcardFiltersItemModel> filterDatesList = [
//     MedcardFiltersItemModel(
//       label: 'Весь',
//       startDate: DateTime.now(),
//       endDate: DateTime.now(),
//       duration: const Duration(days: 10000),
//     ),
//     MedcardFiltersItemModel(
//       label: 'Год',
//       startDate: DateTime.now(),
//       endDate: DateTime.now(),
//       duration: const Duration(days: 365),
//     ),
//     MedcardFiltersItemModel(
//       label: 'Месяц',
//       startDate: DateTime.now(),
//       endDate: DateTime.now(),
//       duration: const Duration(days: 31),
//     ),
//     MedcardFiltersItemModel(
//       label: 'Неделя',
//       startDate: DateTime.now(),
//       endDate: DateTime.now(),
//       duration: const Duration(days: 7),
//     ),
//     MedcardFiltersItemModel(
//       label: 'Сегодня',
//       startDate: DateTime.now(),
//       endDate: DateTime.now(),
//       duration: const Duration(days: 1),
//     ),
//   ];
//
//   static List<MedcardFiltersItemModel> filterCategoryList = [
//     const MedcardFiltersItemModel(
//       label: 'Все',
//       categoryName: '',
//     ),
//     const MedcardFiltersItemModel(
//       label: 'Анализы',
//       categoryName: 'lab',
//     ),
//     const MedcardFiltersItemModel(
//       label: 'Диагностика',
//       categoryName: 'instrumental',
//     ),
//     const MedcardFiltersItemModel(
//       label: 'Осмотры',
//       categoryName: 'consult',
//     ),
//   ];
// }
//
// class MedcardFiltersBar extends StatelessWidget implements PreferredSizeWidget {
//   const MedcardFiltersBar({Key? key})
//       : preferredSize = const Size.fromHeight(56),
//         super(key: key);
//
//   @override
//   final Size preferredSize; // default is 56.0
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.secondBackground,
//       child: CustomScrollView(
//         shrinkWrap: true,
//         slivers: MedcardFiltersList.medcardFiltersList
//             .map((item) => (
//                       backgroundColor: AppColors.secondBackground,
//                       leading: const SizedBox(),
//                       title: Column(
//                         children: [
//                           Text(item.label,
//                               style: Theme.of(context).textTheme.labelSmall),
//                           SizedBox(height: 60,)
//                         ],
//                       ),
//                       centerTitle: false,
//                       titleSpacing: -50,
//                       // pinned: true,
//                       // floating: false,
//                       // expandedHeight: 50.0,
//                       flexibleSpace: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: item.filters.length,
//                         separatorBuilder: (context, index) => const SizedBox(
//                           width: 10.0,
//                         ),
//                         itemBuilder: (context, index) {
//                           return ChoiceChip(
//                             selected: false,
//                             label: Text(item.filters[index].label),
//                             onSelected: (selected) {
//                               // if (selected) {
//                               //   setState(() {
//                               //     _selectedIndex = index;
//                               //   });
//                               // }
//                             },
//                           );
//                         },
//                       ),
//                     )
//                 // Padding(
//                 //       padding: const EdgeInsets.only(
//                 //           top: 16.0, right: 0, bottom: 21.0, left: 16.0),
//                 //       child: Column(
//                 //         crossAxisAlignment: CrossAxisAlignment.start,
//                 //         children: [
//                 //           Text(
//                 //             e.label,
//                 //             style: Theme.of(context).textTheme.labelSmall,
//                 //           ),
//                 //           const SizedBox(height: 21.0),
//                 //           // CustomScrollView(
//                 //           //   scrollDirection: Axis.horizontal,
//                 //           //   slivers: [
//                 //           //     ...e.filters
//                 //           //         .map((item) => Padding(
//                 //           //           padding: const EdgeInsets.only(right: 10.0),
//                 //           //           child: Container(
//                 //           //               padding: const EdgeInsets.symmetric(
//                 //           //                   vertical: 6.0, horizontal: 12.0),
//                 //           //               decoration: BoxDecoration(
//                 //           //                 color: Theme.of(context).backgroundColor,
//                 //           //                 borderRadius: const BorderRadius.all(
//                 //           //                     Radius.circular(50)),
//                 //           //                 boxShadow: const [
//                 //           //                   BoxShadow(
//                 //           //                     color: Colors.black12,
//                 //           //                     blurRadius: 20,
//                 //           //                     offset: Offset(0, 8),
//                 //           //                   ),
//                 //           //                 ],
//                 //           //               ),
//                 //           //               child: Text(item.label)),
//                 //           //         ))
//                 //           //         .toList()
//                 //           //   ],
//                 //           // )
//                 //         ],
//                 //       ),
//                 //     ))
//                 )
//             .toList(),
//       ),
//     );
//   }
// }
