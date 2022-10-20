class PriceFilterItem {
  final String label;
  final bool isSelected;
  final String value;

  PriceFilterItem({
    required this.label,
    required this.isSelected,
    required this.value,
  });
}

List<PriceFilterItem> priceFiltersList = [
  PriceFilterItem(label: 'Все', isSelected: false, value: ''),
  PriceFilterItem(label: 'Анализы', isSelected: false, value: 'Lab'),
  PriceFilterItem(label: 'Диагностика', isSelected: false, value: 'Instrumental'),
  PriceFilterItem(label: 'Осмотры', isSelected: false, value: 'Consult'),
  PriceFilterItem(label: 'Процедуры', isSelected: false, value: 'Proc'),
];
