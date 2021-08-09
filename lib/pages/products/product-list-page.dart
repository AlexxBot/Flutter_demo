import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/product.dart';
import 'package:flutter_demo/services/product-service.dart';

class ProductListPage extends StatefulWidget {
  final String titulo;
  const ProductListPage({Key? key, this.titulo = ''}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ProductService productService = ProductService();

  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    productService.listarProducts().then((lista) {
      //print('esta es la lista de productos' + jsonEncode(lista).toString());

      setState(() {
        productList = lista;
      });
      //print(productList.length);
    });
  }

  void accion(int indice, String id) {
    print('se presiono el container con indice ' + indice.toString());
    //Navigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.titulo)),
        body:
            /* ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(productList[index].name),
                subtitle: Text(productList[index].category));
            //leading: Icon(child: Text(index.toString())));
          },
          itemCount: productList.length,
        ) */
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(productList[index].name),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => accion(index, productList[index].id),
              );
            },
            itemCount: productList.length,
          ),
        ));
  }
}
