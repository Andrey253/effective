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
    final f = width * 0.31;
    final radiusNew = width * 0.032;
    final circular = width * 0.024;
    // print('teg $width');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontal, vertical: 7),
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
                        topLeft: Radius.circular(circular),
                        bottomLeft: Radius.circular(circular)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03,
                        bottom: width * 0.03,
                        top: width * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorsConst.red,
                          radius: radiusNew,
                          child: Text(
                            'New',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'SFPRODISPLAYREGULAR',
                                fontSize: width * 0.022),
                          ),
                        ),
                        Text(
                          store.homeStore[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'SFPRODISPLAYREGULAR',
                              fontSize: width * 0.055),
                        ),
                        Text(
                          store.homeStore[index].subtitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'SFPRODISPLAYREGULAR',
                              fontSize: width * 0.024),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Buy now!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'SFPRODISPLAYREGULAR',
                                  fontSize: width * 0.024),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize:
                                  Size(width * 0.23, width * 0.055), // Set this
                              padding: EdgeInsets.zero,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: f,
                top: 0,
                width: width - horizontal * 2 - f,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(circular),
                        bottomRight: Radius.circular(circular)),
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
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
