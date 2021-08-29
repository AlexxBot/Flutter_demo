import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo/pages/login/login-page.dart';
import 'package:flutter_demo/pages/product/product-list-page.dart';
import 'package:flutter_demo/services/product-service.dart';
import './pages/list-page.dart';
import 'app.dart';
import 'bloc/product/product_bloc.dart';
import 'services/auth-service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthService())),
      /* BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(ProductService())) */
    ], child: App());
    /* return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthService()), child: App()); */
  }
}

//STATELESS WIDGET -> COMPONENTE SIN ESTADO. EJM LABEL, APPBAR, IMAGEN, LOGO,
//STATEFULL WIDGET -> COMPONENTE QUE SE PUEDE RENDERIZAR, EJ, CONTAINER LIST, INPUTS, SELECTED
/* class MyWidget extends StatefulWidget {
  //widget sin estado// que no se repintan

  final String titulo;
  final int contador;

  const MyWidget({Key? key, this.titulo = 'My titulo', this.contador = 0})
      : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int mycontador = 0;

  @override
  void initState() {
    super.initState();
    print("se inicializo el componente MYWIDGET");
    //listar desde la api
    // suscribirse a un stream de datos

    mycontador = widget.contador; //10
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //desuscribirte a el stream de datos

    print('esto se ejecuta cuando se destruye el widget');
  }

  void incrementar() {
    //logica
    mycontador = mycontador + 1;
    print(mycontador.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(this.widget.titulo)),
      ),
      body: Center(
          child:
              /* Text(this.widget.titulo,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)) */
              Text(mycontador.toString(),
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => incrementar(), child: Icon(Icons.add)),
    );
  }
}
 */