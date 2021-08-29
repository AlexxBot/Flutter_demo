import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo/bloc/product/product_bloc.dart';
import 'package:flutter_demo/models/product.dart';
import 'package:flutter_demo/pages/product/product-list-page.dart';
import 'package:flutter_demo/services/product-service.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late final authBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        //color: Colors.white,
        //width: MediaQuery.of(context).size.width - 100,
        child: ListView(
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 200,
                color: Colors.blueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(authBloc.userName,
                        style: TextStyle(color: Colors.white))
                  ],
                )),
            ExpansionTile(
              title: Text("Mantenimientos"),
              children: [
                ListTile(
                  title: Text("Products"),
                  onTap: () => Navigator.of(context).pushNamed('/product'),
                ),
                ListTile(
                  title: Text("Chat"),
                  onTap: () => Navigator.of(context).pushNamed('/chat'),
                )
              ],
            )

            /* ListView(
              children: [
                ExpansionPanelList(
                  children: [ExpansionPanel( headerBuilder: (context, true){

                  }, body: Text("hola"))],
                )
              ],
            ) */
          ],
        ),
      ),
    );
  }
}
