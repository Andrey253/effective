import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/model/store/store.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class ListHomeStore extends StatelessWidget {
  const ListHomeStore({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final f = width * 0.35;
    // print('teg $width');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontal, vertical: 20),
      child: Container(
        height: 200,
        child: PageView.builder(
          itemBuilder: (context, index) => Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                width: f + 1,
                height: 200,
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                ),
              ),
              Positioned(
                left: f,
                top: 0,
                width: width - horizontal * 2 - f,
                height: 200,
                child: Container(
                  // alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(store.homeStore[index].picture),
                    ),
                  ),
                ),
              ),
            ],
          ),
          itemCount: store.homeStore.length,
        ),
      ),
    );
  }
}
