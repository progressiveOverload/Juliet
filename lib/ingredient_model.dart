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
  {
    'ingredient_name': 'Nohut',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Fasulye',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Kırmızı Mercimek',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Bakla',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Bezelye',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Börülce',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Barbunya',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Soya Fasulyesi',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Yeşil Mercimek',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Sarı Mercimek',
    'category_name': "Baklagil",
  },
  {
    'ingredient_name': 'Mısır',
    'category_name': "Baklagil",
  },
//baklagil_son
  //balık_başlangıç
];
