const List<String> visibilityList = [
  'Виден всем',
  'Виден только администратору',
];

String getValueVisibilityByLabel(String label) {
  switch (label) {
    case 'Виден всем':
      return '1';
    case 'Виден только администратору':
      return '0';
    default:
      return '0';
  }
}
