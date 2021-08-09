import 'package:flutter/material.dart';
import 'package:flutter_demo/models/persona.dart';

class ListPage extends StatefulWidget {
  final String titulo;
  const ListPage({Key? key, this.titulo = ''}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    final persona = new Persona("5", "alex", 25);
    print('id ' + persona.id);
    print('nombre ' + persona.nombre);
    print('edad ' + persona.edad.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LISTA"),
        ),
        body: ListView(children: [
          Text("uno "),
          Text("dos "),
          Text("tres "),
          Text("cuatro "),
          Text("cinco "),
          Text("seis "),
          Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            //width: 50,
            //child: Text("este es my container"),
          ),
          MaterialButton(
            onPressed: null,
            child: Text("my boton"),
          )
        ]));
  }
}
