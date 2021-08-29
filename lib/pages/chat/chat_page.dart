import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../global.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late IO.Socket socket;
  String? userid;

  late var subscription;
  @override
  void initState() {
    super.initState();
    //IO.Socket socket;

    /* Timer(Duration(seconds: 1), _connection);

    var future = new Future.delayed(const Duration(
        milliseconds: 10)); */ //aqui tambien  se podria poner la funcion
    //subscription = future.asStream().listen(_connection);

    _connection();
  }

  void _connection() {
    socket = IO.io(
      /* "http://localhost:3000" */
      URL,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false
      },
    );
    print('esto se ejecuta antes de que se conecte al socket');
    socket.connect();
    socket.onConnect((data) {
      print('se establecio conection');
      userid = socket.id;
      print("id: " + userid!);
      socket.on('carrito:all', (data) {
        print("mensaje: " + data.toString());
      });
    });

    //socket.emit('carrito:all', {'id': userid});
    socket.on('carrito:all', (data) {
      print("message " + data.toString());
    });
  }

  void _verifyConnection() {
    socket.connect();
    if (socket.connected) {
      print("HAY CONEXION");
    } else {
      print("no hay conexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text("Hola")],
        ),
      ),
      bottomSheet: Container(
        child: RawMaterialButton(
          onPressed: _verifyConnection,
          child: Text("VERIFICA"),
        ),
      ),
      /* bottomNavigationBar: TabBar(
        tabs: [
          IconButton(onPressed: _verifyConnection, icon: Icon(Icons.face))
        ],
      ), */
    );
  }
}
