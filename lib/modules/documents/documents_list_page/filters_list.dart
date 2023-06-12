import 'package:medlike/data/models/document_models/document_models.dart';

List<DocumentFilterModel> documentFiltersList = [
  const DocumentFilterModel(
      title: 'Статус документа',
      value: '1',
      filters: <DocumentFilterItemModel>[
        DocumentFilterItemModel(
          categoryLabel: 'Статус документа',
          value: '',
          label: 'Все',
        ),
        DocumentFilterItemModel(
          categoryLabel: 'Статус документа',
          value: 'Подписан',
          label: 'Подписан',
        ),
        DocumentFilterItemModel(
          categoryLabel: 'Статус документа',
          value: 'Не подписан',
          label: 'Не подписан',
        ),
      ]),
];
