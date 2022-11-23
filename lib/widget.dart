// // EXAMPLE use case for TextFieldSearch Widget
// import 'package:flutter/material.dart';
// import 'package:textfield_search/textfield_search.dart';
// import 'dart:async';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title = 'My Home Page'}) : super(key: key);

//   final String title;

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   final _testList = [
//     'deneme Item 1',
//     'Test Item 2',
//     'Test Item 3',
//     'Test Item 4',
//   ];

//   // TextEditingController myController = TextEditingController();
//   TextEditingController myController2 = TextEditingController();
//   // TextEditingController myController3 = TextEditingController();
//   // TextEditingController myController4 = TextEditingController();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   myController.addListener(_printLatestValue);
//   //   myController2.addListener(_printLatestValue);
//   //   myController3.addListener(_printLatestValue);
//   //   myController4.addListener(_printLatestValue);
//   // }

//   // _printLatestValue() {
//   //   print("text field: ${myController.text}");
//   //   print("text field: ${myController2.text}");
//   //   print("text field: ${myController3.text}");
//   //   print("text field: ${myController4.text}");
//   // }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the
//     // widget tree.
//     // myController.dispose();
//     myController2.dispose();
//     // myController3.dispose();
//     // myController4.dispose();
//     super.dispose();
//   }

//   Future<List> fetchSimpleData() async {
//     await Future.delayed(const Duration(milliseconds: 2000));
//     List list = <dynamic>[];
//     // create a list from the text input of three items
//     // to mock a list of items from an http call
//     list.add('Test' ' Item 1');
//     list.add('Test' ' Item 2');
//     list.add('Test' ' Item 3');
//     return list;
//   }

//   // mocking a future that returns List of Objects
//   Future<List> fetchComplexData() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     List list = <dynamic>[];
//     List jsonList = [
//       {'label': 'Text' ' Item 1', 'value': 30},
//       {'label': 'Text' ' Item 2', 'value': 31},
//       {'label': 'Text' ' Item 3', 'value': 32},
//     ];
//     // create a list from the text input of three items
//     // to mock a list of items from an http call where
//     // the label is what is seen in the textfield and something like an
//     // ID is the selected value
//     list.add(TestItem.fromJson(jsonList[0]));
//     list.add(TestItem.fromJson(jsonList[1]));
//     list.add(TestItem.fromJson(jsonList[2]));

//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Form(
//           child: ListView(
//             children: <Widget>[
//               const SizedBox(height: 16),
//               TextFieldSearch(
//                   label: 'Simple Future List',
//                   controller: myController2,
//                   future: () {
//                     return fetchSimpleData();
//                   }),
//               // const SizedBox(height: 16),
//               // TextFieldSearch(
//               //   label: 'Complex Future List',
//               //   controller: myController3,
//               //   future: () {
//               //     return fetchComplexData();
//               //   },
//               //   // getSelectedValue: (item) {
//               //   //   print(item);
//               //   // },
//               //   minStringLength: 5,
//               //   textStyle: const TextStyle(color: Colors.red),
//               //   decoration:
//               //       const InputDecoration(hintText: 'Search For Something'),
//               // ),
//               // const SizedBox(height: 16),
//               // TextFieldSearch(
//               //     label: 'Future List with custom scrollbar theme',
//               //     controller: myController4,
//               //     scrollbarDecoration: ScrollbarDecoration(
//               //         controller: ScrollController(),
//               //         theme: ScrollbarThemeData(
//               //             radius: const Radius.circular(30.0),
//               //             thickness: MaterialStateProperty.all(20.0),

//               //             trackColor: MaterialStateProperty.all(Colors.red))),
//               //     future: () {
//               //       return fetchSimpleData();
//               //     }),
//               // const SizedBox(height: 16),
//               // TextFieldSearch(
//               //     initialList: _testList,
//               //     label: 'Simple List',tes
//               //     controller: myController),
//               // const SizedBox(height: 16),
//               // TextFormField(
//               //   decoration: const InputDecoration(labelText: 'Description'),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /* Future<List> fetchSimpleData() async {
//     await Future.delayed(const Duration(milliseconds: 2000));
//     List list = <dynamic>[];
//     // create a list from the text input of three items
//     // to mock a list of items from an http call
//     list.add('Test' ' Item 1');
//     list.add('Test' ' Item 2');
//     list.add('Test' ' Item 3');
//     return list;
//   }
// */
// // Mock Test Item Class
// class TestItem {
//   final String label;
//   dynamic value;

//   TestItem({required this.label, this.value});

//   factory TestItem.fromJson(Map<String, dynamic> json) {
//     return TestItem(label: json['label'], value: json['value']);
//   }
// }
