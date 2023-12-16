class Laptops{
  String? status;
  String? message;
  List<Product>? product;

  Laptops({this.status, this.message, this.product});

  Laptops.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      product = <Product>[];
      json['products'].forEach((v) {
        product!.add( Product.fromJson(v));
      });
    }
  }
}

class Product {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  String? company;
  dynamic countInStock;
  List<String>? images;
  dynamic iV;
  bool? inCart = false;
  bool? inFavorite = false;

  Product(
      {this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.company,
        this.countInStock,
        this.iV,
        this.inCart,
        this.inFavorite,
      });

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    company = json['company'];
    images = json['images'].cast<String>();
    countInStock = json['countInStock'];
    iV = json['__v'];
    inCart = json['inCart'];
    inFavorite = json['inFavorites'];
  }

}