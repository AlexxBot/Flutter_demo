import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/pages/chat/chat_page.dart';
import 'package:flutter_demo/pages/login/login-page.dart';
import 'package:flutter_demo/pages/product/product-list-page.dart';
import 'package:flutter_demo/services/product-service.dart';

import 'bloc/product/product_bloc.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blueAccent),
        initialRoute: "/chat",
        routes: {
          "/": (context) => LoginPage(),
          "/product": (context) => BlocProvider<ProductBloc>(
              create: (context) => ProductBloc(ProductService()),
              child: ProductListPage()),
          "/chat": (context) => ChatPage()
        });
  }
}
