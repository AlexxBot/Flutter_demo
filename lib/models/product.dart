class Product {
  String id = '';
  String name = '';
  String category = '';
  double price = 0;
  String imgURL = '';

  Product(String _id, String _name, String _category, double _price,
      String _imgURL) {
    id = _id;
    name = _name;
    category = _category;
    price = _price;
    imgURL = _imgURL;
  }

  static Product fromJson(Map<String, dynamic> json) {
    print(json);
    return Product(json['_id'], json['name'], json['category'],
        double.parse(json['price'].toString()), json['imgURL']);
  }
}
