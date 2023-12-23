import 'package:ecommerce_training/models/product_model.dart';

class FavoritesModel {
  String? status;
  List<Product>? favoriteProducts;

  FavoritesModel({this.status, this.favoriteProducts});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['favoriteProducts'] != null) {
      favoriteProducts = <Product>[];
      json['favoriteProducts'].forEach((v) {
        favoriteProducts!.add(Product.fromJson(v));
      });
    }
  }
}
