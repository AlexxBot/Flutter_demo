import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/product/product_bloc.dart';

class BusquedaWidget extends StatefulWidget {
  const BusquedaWidget({Key? key}) : super(key: key);

  @override
  _BusquedaWidgetState createState() => _BusquedaWidgetState();
}

class _BusquedaWidgetState extends State<BusquedaWidget> {
  late ProductBloc productBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
  }

  _busqueda() {
    productBloc.add(ListarEvent());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: _busqueda, icon: Icon(Icons.search));
  }
}
