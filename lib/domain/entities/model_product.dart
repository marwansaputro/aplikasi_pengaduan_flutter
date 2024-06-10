import 'package:flutter/material.dart';

class ModelProduct {
  final IconData icon;
  final String title;
  final String description;

  final List<ModelItemProduct> itemProduct;

  ModelProduct(
      {required this.icon,
      required this.title,
      required this.description,
      required this.itemProduct});
}

class ModelItemProduct {
  final IconData icon;
  final String title;

  ModelItemProduct({required this.icon, required this.title});
}
