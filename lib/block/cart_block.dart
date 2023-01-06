// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/block/state.dart';
import 'package:effective/widgets/cart/cart_home.dart';
import 'package:effective/widgets/details/detais_home.dart';
import 'package:flutter/material.dart';

import 'package:effective/block/details_state.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/repository/repository.dart';

class CartBlock extends AppBlock<CartState> {
  CartBlock({required super.repository, required super.type});

  }
  