import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/product/product_bloc.dart';
import 'package:flutter_demo/models/product.dart';
import 'package:flutter_demo/pages/menu-page.dart';
import 'package:flutter_demo/pages/product/product-form-page.dart';
import 'package:flutter_demo/services/product-service.dart';

class ProductListPage extends StatefulWidget {
  final String titulo;
  const ProductListPage({Key? key, this.titulo = 'Items'}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  //final ProductService productService = ProductService();

  //List<Product> productList = [];

  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(ListarEvent());

    /* productService.listarProducts().then((lista) {
      //print('esta es la lista de productos' + jsonEncode(lista).toString());

      setState(() {
        productList = lista;
      });
      //print(productList.length);
    }); */
  }

  Future<Null> _handleRefresh() async {
    //await Future.delayed(Duration(seconds: 2));
    productBloc.add(ListarEvent());
    return null;
  }

  /* void accion(int indice, String id) {
    print('se presiono el container con indice ' + indice.toString());
    //Navigator();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(title: Text(widget.titulo)),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: BlocBuilder<ProductBloc, ProductState>(
          bloc: productBloc,
          builder: (context, state) {
            if (state is ListadoState) {
              return ProductList(products: state.products);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      )

      /* RefreshIndicator(
            child: FutureBuilder(
              future: ,
          builder: (context, products) {
            return ListView(

            )
          },
        ),
        onRefresh: _refresh,) */

      /* ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(productList[index].name),
                subtitle: Text(productList[index].category));
            //leading: Icon(child: Text(index.toString())));
          },
          itemCount: productList.length,
        ) */
      /* Padding(
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
        )*/
      ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ad_units),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductFormPage())),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(this.products[index].name),
            subtitle: Text(this.products[index].category),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductFormPage(
                          id: this.products[index].id,
                        ))),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
