class ItemFormRequest {
  const ItemFormRequest.create({this.name, this.shortCode, this.categoryKey})
      : itemId = null;

  const ItemFormRequest.edit(String this.itemId)
      : name = null,
        shortCode = null,
        categoryKey = null;

  final String? itemId;
  final String? name;
  final String? shortCode;
  final String? categoryKey;

  bool get isEdit => itemId != null;

  @override
  bool operator ==(Object other) =>
      other is ItemFormRequest &&
          other.itemId == itemId &&
          other.name == name &&
          other.shortCode == shortCode &&
          other.categoryKey == categoryKey;

  @override
  int get hashCode => Object.hash(itemId, name, shortCode, categoryKey);
}