part of 'product_bloc.dart';

enum Proceso { Listar, Guardar, Eliminar, Recuperar }

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProcesandoState extends ProductState {
  final Proceso proceso;
  ProcesandoState(this.proceso);
}

class ProcesadoState extends ProductState {
  final bool respuesta;
  final String mensaje;

  ProcesadoState(this.respuesta, this.mensaje);
}

class RecuperadoState extends ProductState {
  final bool existe;
  final Product product;
  RecuperadoState(this.existe, this.product);
}

class ListadoState extends ProductState {
  final List<Product> products;

  ListadoState(this.products);
}

class ErrorState extends ProductState {
  final Proceso proceso;
  final String mensaje;
  ErrorState(this.proceso, this.mensaje);
}
