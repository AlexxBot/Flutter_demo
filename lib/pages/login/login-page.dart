import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/auth/auth_bloc.dart';
import 'package:flutter_demo/bloc/product/product_bloc.dart' as productBloc;
import 'package:flutter_demo/pages/product/product-list-page.dart';
import 'package:flutter_demo/services/product-service.dart';
import 'package:flutter_demo/widgets/button-widget.dart';
import 'package:flutter_demo/widgets/loading-widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc authBloc;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameController =
      TextEditingController(text: "alex.hotmail.com");
  TextEditingController _passwordController =
      TextEditingController(text: "alex");

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _login() {
    authBloc
        .add(LoginEvent(_userNameController.text, _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/login.png'),
                ),
                Form(
                  key: _formKey,
                  child: BlocListener<AuthBloc, AuthState>(
                    bloc: authBloc,
                    listener: (context, state) {
                      if (state is ProcesandoState) {
                        LoadingWidget.show(context);
                      }
                      if (state is LoggedInState) {
                        LoadingWidget.hide(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BlocProvider<productBloc.ProductBloc>(
                                        create: (context) =>
                                            productBloc.ProductBloc(
                                                ProductService()),
                                        child: ProductListPage())));

                        //Navigator.pushNamed(context, '/product');
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                              alignment: const Alignment(0.9, 0.0),
                              children: [
                                TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "User"),
                                    controller: _userNameController),
                                Icon(Icons.person)
                              ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                                alignment: const Alignment(0.9, 0.0),
                                children: [
                                  TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Password"),
                                      controller: _passwordController),
                                  Icon(
                                    Icons.person,
                                    color: Colors.blueAccent,
                                  )
                                ])),
                        ButtonWidget(title: "Login", onPressed: _login)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
