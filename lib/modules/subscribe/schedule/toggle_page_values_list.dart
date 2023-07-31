class TogglePageValueItem {
  final String id;
  final String label;

  TogglePageValueItem({
    required this.id,
    required this.label,
  });
}

List<TogglePageValueItem> togglePageValuesList = [
  TogglePageValueItem(id: '1', label: 'Записаться'),
  TogglePageValueItem(id: '2', label: 'О враче'),
];
