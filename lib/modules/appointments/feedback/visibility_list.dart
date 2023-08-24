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

String getLabelVisibilityByValue(int value) {
  switch (value) {
    case 1:
      return 'Виден всем';
    case 0:
      return 'Виден только администратору';
    default:
      return 'Виден всем';
  }
}
