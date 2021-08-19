part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ListarEvent extends ProductEvent {
  //aqui van los parmetros de busqueda
}

class RecuperarEvent extends ProductEvent {
  final String id;
  RecuperarEvent(this.id);
}

class GuardarEvent extends ProductEvent {
  final String token;
  final Product product;

  GuardarEvent(this.token, this.product);
}

class EliminarEvent extends ProductEvent {
  final String id;
  EliminarEvent(this.id);
}
