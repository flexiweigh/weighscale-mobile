const categoryNameMaxLength = 40;
const customCategorySortOrder = 100;

class Category {
  const Category({required this.id, required this.name, this.systemKey});

  final String id;
  final String name;
  final String? systemKey;

  bool get isSystem => systemKey != null;
}

class SystemCategory {
  const SystemCategory(this.key, this.name, this.sortOrder);

  final String key;
  final String name;
  final int sortOrder;

  String get id => 'category-$key';
}

const systemCategories = [
  SystemCategory('metal', 'Metal', 10),
  SystemCategory('plastic', 'Plastic', 20),
  SystemCategory('paper', 'Paper', 30),
  SystemCategory('rubber', 'Rubber', 40),
  SystemCategory('other', 'Other', 50),
];

sealed class CategorySelection {
  const CategorySelection();
}

final class ExistingCategory extends CategorySelection {
  const ExistingCategory(this.id);

  final String id;
}

final class NewCategory extends CategorySelection {
  const NewCategory(this.name);

  final String name;
}