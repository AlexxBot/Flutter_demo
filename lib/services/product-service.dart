import 'package:flutter_demo/models/product.dart';
import '../global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  final String urlProduct = URL + '/products';

  String mensajeError = '';
  bool hayError = false;

  //ProductService()
  //Promise<CPersona>
  //Task<CPersona>
  Future<List<Product>> listarProducts() async {
    try {
      var url = Uri.parse(urlProduct);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        hayError = false;
        //mapear los datos a json
        //retornar
        final lista = jsonDecode(response.body);

        final List<Product> productList = lista.map<Product>((productJson) {
          return Product.fromJson(productJson);
        }).toList();
        return productList;
      } else {
        hayError = true;
        return [];
      }
    } catch (e) {
      print(e);
      hayError = true;
      return [];
    }
    //return Future.value([]);
  }
}
