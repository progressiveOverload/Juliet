// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:searchfield/searchfield.dart';
import 'ingredient_model.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("ingredient_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Dolabım'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _ingredientBox = "ingredient_box";

  final _formKey = GlobalKey<FormState>();

  final _itemNameController = TextEditingController();

  final focus = FocusNode();
//dispose as necessarily
  @override
  void dispose() {
    focus.dispose();
    Hive.close();
    _itemNameController.dispose();

    super.dispose();
  }

  List<Ingredient> ingredients = [];
  Ingredient _selectedIngredient = Ingredient.init();
  @override
  void initState() {
    super.initState();
    ingredients = data.map((e) => Ingredient.fromMap(e)).toList();
  }

  bool containsIngredients(String text) {
    final Ingredient result = ingredients.firstWhere(
        (Ingredient country) =>
            country.name.toLowerCase() == text.toLowerCase(),
        orElse: () => Ingredient.init());

    if (result.name.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dolabım",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 12, 82),
      ),
      body: Container(
        color: const Color.fromARGB(255, 27, 198, 210),
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 44),
        child: ValueListenableBuilder(
          valueListenable: Hive.box(_ingredientBox).listenable(),
          builder: (BuildContext context, Box box, _) {
            //use keys to get item names
            if (box.keys.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: const Text(
                      "Dolabın boş gözüküyor alttaki butondan malzeme eklemeye başla!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            }

            List itemNames = [];

            itemNames.add("card head");

            itemNames.addAll(box.keys.toList().reversed.toList());

            return ListView.builder(
                itemCount: itemNames.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return cartHeadWidget((itemNames.length - 1)
                        .toString()); //remove the head item
                  }
                  return shoppingRowItem(
                    itemNames.elementAt(index).toString(),
                    Hive.box(_ingredientBox)
                        .get(itemNames.elementAt(index))
                        .toString(),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 31, 12, 82),
          onPressed: () {
            addNewShoppingItem(context);
          },
          tooltip: 'Malzeme ekle',
          child: const Icon(Icons.add)),
    );
  }

  //cart head widget
  Widget cartHeadWidget(String itemCount) {
    return FractionallySizedBox(
      widthFactor: 0.21,
      child: Container(
        padding: const EdgeInsets.only(left: 0),
        margin: const EdgeInsets.only(top: 25, bottom: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0XFFe5cec6),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.kitchen,
              size: 70,
            ),
            //
          ],
        ),
      ),
    );
  }

  Widget shoppingRowItem(String name, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), //50 or 20
        color: Colors.white70,
        border: Border.all(width: 1, color: Colors.black54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0XFFe5cec6),
                shape: BoxShape.rectangle,
              ),
              child: const Icon(
                Icons.kitchen,
                size: 20,
              ),
            ),
          ),

          //the item title and count
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          //end btns
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //delete btn
              InkWell(
                onTap: () {
                  //delete btn clicked
                  deleteShoppingItem(context, name);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0XFFe5cec6),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Icon(
                    Icons.delete,
                    size: 20,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  void deleteShoppingItem(BuildContext context, String item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" Dolabımdan \"$item\" çıkar? "),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("İptal")),
              TextButton(
                child: const Text("Çıkar"),
                onPressed: () {
                  Hive.box(_ingredientBox).delete(item);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void addNewShoppingItem(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dolaba malzeme ekle"),
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: SearchField(
                        suggestionState: Suggestion.hidden,
                        hasOverlay: true,
                        hint: "Malzeme ekle",
                        suggestions: ingredients
                            .map((malzeme) => SearchFieldListItem(malzeme.name,
                                item: malzeme))
                            .toList(),
                        controller: _itemNameController,
                        validator: (value) {
                          if (value!.isEmpty || !containsIngredients(value)) {
                            return 'Böyle bir malzeme bulamadık 🤔 ';
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        onSuggestionTap: (SearchFieldListItem<Ingredient> x) {
                          setState(() {
                            _selectedIngredient = x.item!;
                          });
                          _formKey.currentState!.validate();
                          focus.unfocus();
                        },
                      ),
                    ),
                  ],
                )),
            actions: [
              TextButton(
                child: const Text("İptal"),
                onPressed: () {
                  showToast(context, "İptal Edildi");
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Ekle"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Hive.box(_ingredientBox).put(_itemNameController.text, 1);

                    showToast(
                        context, "${_itemNameController.text} kaydedildi!");
                    _itemNameController.clear();

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  void showToast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    ));
  }
}
