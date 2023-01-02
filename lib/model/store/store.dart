// To parse this JSON data, do
//
//     final sotore = sotoreFromJson(jsonString);

import 'package:effective/model/store/best-seller.dart';
import 'package:effective/model/store/home_store.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Store sotoreFromJson(String str) => Store.fromJson(json.decode(str));

String sotoreToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    required this.homeStore,
    required this.bestSeller,
  });

  final List<HomeStore> homeStore;
  final List<BestSeller> bestSeller;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        homeStore: List<HomeStore>.from(
            json["home_store"].map((x) => HomeStore.fromJson(x))),
        bestSeller: List<BestSeller>.from(
            json["best_seller"].map((x) => BestSeller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_store": List<dynamic>.from(homeStore.map((x) => x.toJson())),
        "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
      };
}
