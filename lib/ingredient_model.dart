class Ingredient {
  final String name;
  final String category;

  Ingredient(this.name, this.category);

  Ingredient.init()
      : name = '',
        category = "";

  Ingredient.fromMap(Map<String, Object> map)
      : name = map['ingredient_name'] as String,
        category = map['category_name'] as String;
}

List<Map<String, Object>> data = [
  {'ingredient_name': 'Afghanistan', 'category_name': "Baharat"}
];
