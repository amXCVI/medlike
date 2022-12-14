import 'package:intl/intl.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';

List<MedcardFilterModel> medcardFiltersList = [
  MedcardFilterModel(
      title: 'Период',
      value: '2',
      filters: <MedcardFilterItemModel>[
        const MedcardFilterItemModel(
            categoryLabel: 'Период',
            value: 'dateBegin=&dateEnd=',
            label: 'Весь'),
        MedcardFilterItemModel(
            categoryLabel: 'Период',
            value:
                'dateBegin=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: -366)))}&dateEnd=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: 1)))}',
            label: 'Год'),
        MedcardFilterItemModel(
            categoryLabel: 'Период',
            value:
                'dateBegin=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: -31)))}&dateEnd=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: 1)))}',
            label: 'Месяц'),
        MedcardFilterItemModel(
            categoryLabel: 'Период',
            value:
                'dateBegin=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: -7)))}&dateEnd=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: 1)))}',
            label: 'Неделя'),
        MedcardFilterItemModel(
            categoryLabel: 'Период',
            value:
                'dateBegin=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: 0)))}&dateEnd=${DateFormat("yyyy-MM-dd").format(DateTime.now().add(const Duration(days: 1)))}',
            label: 'Сегодня'),
      ]),
  const MedcardFilterModel(
      title: 'Категория',
      value: '1',
      filters: <MedcardFilterItemModel>[
        MedcardFilterItemModel(
          categoryLabel: 'Категория',
          value: '',
          label: 'Все',
        ),
        MedcardFilterItemModel(
          categoryLabel: 'Категория',
          value: 'category=lab',
          label: 'Анализы',
        ),
        MedcardFilterItemModel(
          categoryLabel: 'Категория',
          value: 'category=instrumental',
          label: 'Диагностика',
        ),
        MedcardFilterItemModel(
          categoryLabel: 'Категория',
          value: 'category=consult',
          label: 'Осмотры',
        ),
      ]),
];
