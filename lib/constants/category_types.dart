class CategoryTypes {
  static List<CategoryType> categoryTypes = [
    CategoryType(-1, 'Unknown', ''),
    CategoryType(0, 'Telemed', 'Телемедицинские консультации'),
    CategoryType(1, 'Consultations', 'Консультации'),
    CategoryType(2, 'Laboratory', 'Лабораторные исследования'),
    CategoryType(3, 'MRT', 'МРТ'),
    CategoryType(4, 'UZI', 'УЗИ'),
    CategoryType(5, 'XRay', 'Рентген'),
    CategoryType(6, 'Proc', 'Процедуры и манипуляции'),
    CategoryType(7, 'Instrumental', 'Инструментальные исследования'),
    CategoryType(8, 'Other', 'Прочее'),
    CategoryType(9, 'Endoscopy', 'Эндоскопия'),
    CategoryType(10, 'Stomatology', 'Стоматология'),
    CategoryType(11, 'Cosmetology', 'Косметология'),
    CategoryType(12, 'Gynecology', 'Гинекология'),
    CategoryType(13, 'Exercisetherapy', 'ЛФК'),
    CategoryType(14, 'Ct', 'КТ'),
    CategoryType(15, 'Funcdiagnostics', 'Функциональная диагностика'),
  ];

  /// Список ID категорий, которые не услуги.
  static List<int> serviceCategoryTypeIds = [0, 1];

  static CategoryType getCategoryTypeByCategoryTypeId(int categoryTypeId) {
    CategoryType findCategoryType = categoryTypes.firstWhere(
        (categoryType) => categoryType.categoryTypeId == categoryTypeId);
    return findCategoryType;
  }
}

class CategoryType {
  final int categoryTypeId;
  final String categoryType;
  final String russianCategoryTypeName;

  CategoryType(
    this.categoryTypeId,
    this.categoryType,
    this.russianCategoryTypeName,
  );
}
