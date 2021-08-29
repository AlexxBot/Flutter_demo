import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo/bloc/product/product_bloc.dart';
//import 'package:flutter_demo/models/product.dart';

class ProductFormPage extends StatefulWidget {
  final String id;
  const ProductFormPage({Key? key, this.id = ""}) : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  late ProductBloc productBloc;
  late AuthBloc authBloc;

  TextEditingController _id = TextEditingController(text: "");
  TextEditingController _name = TextEditingController(text: "");
  TextEditingController _category = TextEditingController(text: '');
  TextEditingController _imgURL = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
    productBloc = BlocProvider.of<ProductBloc>(context);

    productBloc.add(RecuperarEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Formulario"),
        ),
        body: SafeArea(
            child: BlocListener<ProductBloc, ProductState>(
          bloc: productBloc,
          listener: (context, state) {
            if (state is RecuperadoState) {
              print("se recupero el product");
            }
          },
        )));
    /* Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
        )); */
  }
}
