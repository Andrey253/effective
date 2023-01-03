import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:effective/model/a.dart';
import 'package:effective/model/category.dart';
import 'package:effective/model/store/store.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/best_seller.dart';
import 'package:effective/widgets/botom_sheet.dart';
import 'package:effective/widgets/categories.dart';
import 'package:effective/widgets/filter.dart';
import 'package:effective/widgets/line/best_saller.dart';
import 'package:effective/widgets/line/hot_sales.dart';
import 'package:effective/widgets/list_home_store.dart';
import 'package:effective/widgets/search_field.dart';
import 'package:effective/widgets/line/select_category.dart';
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
  late Store store;
  @override
  void initState() {
    // init();
    store = Store.fromJson(a);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.white900,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Filter(dropdownValue: dropdownValue),
                  const SelectCategoryLine(),
                  const CategoryesWidget(),
                  const SearchField(),
                  const HotSalesLine(),
                  ListHomeStore(store: store),
                  const BestSellerLine(),
                  BestSellerWidget(store: store),
                ],
              ),
            ),
            const BottonSheet()
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void init() async {
    final e = await Dio().get(
        'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175',
        options: Options(responseType: ResponseType.json));
    // print('teg ${}');
    final f = Store.fromJson(e.data);
  }
}
