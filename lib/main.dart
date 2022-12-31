import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

import 'help/showeearch_city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // backgroundColor: const Color(0xAAF5F5F5),
        fontFamily: 'Mark-Pro',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        color: ColorsConst.red,
                      ),
                      const SizedBox(width: 8),
                      Text(dropdownValue, style: const TextStyle(fontSize: 19)),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onPressed: () async {
                          final city = await showSearch(
                              context: context, delegate: SearchCity());

                          setState(() => dropdownValue = city);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 11,
                    height: 13,
                    child: Image.asset('assets/filter.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              child: Row(
                children: const [
                   Text(
                    'Select category',
                    style: TextStyle(fontSize: 25),
                  ),
                   Spacer(),
                   Text(
                    'view all',
                    style: TextStyle(fontSize: 19, color: ColorsConst.red),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const[
                 SvgIcon(
                    size: 30,
                    icon: SvgIconData('assets/phone.svg'),
                    color: Colors.grey),
                 SvgIcon(
                    size: 30,
                    icon: SvgIconData('assets/computer.svg'),
                    color: Colors.grey),
                 SvgIcon(
                    size: 30,
                    icon: SvgIconData('assets/health.svg'),
                    color: Colors.grey),
                 SvgIcon(
                    size: 30,
                    icon: SvgIconData('assets/books.svg'),
                    color: Colors.grey),
              ],
            )
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
