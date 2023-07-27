const List<String> visibilityList = [
  'Виден всем',
  'Виден только администратору',
];

String getValueVisibilityByLabel(String label) {
  switch (label) {
    case 'Виден всем':
      return 'Public';
    case 'Виден только администратору':
      return 'Private';
    default:
      return 'Private';
  }
}
