import 'package:effective/model/category.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/categories.dart';
import 'package:effective/widgets/filter.dart';
import 'package:effective/widgets/search_field.dart';
import 'package:effective/widgets/select_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

import 'help/showsearch_city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // backgroundColor: const Color(0xAAF5F5F5),
        fontFamily: 'Mark-Pro',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = list.first;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.white900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Filter(dropdownValue: dropdownValue),
            const SelectCategoryWidget(),
            const CategoryesWidget(),
            const SearchField()
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

