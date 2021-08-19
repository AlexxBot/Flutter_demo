import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_demo/models/product.dart';
import 'package:flutter_demo/services/product-service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;
  ProductBloc(this.productService) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ListarEvent) {
      yield ProcesandoState(Proceso.Listar);

      final products = await productService.listProducts();
      yield ListadoState(products);
    }
    if (event is RecuperarEvent) {
      yield ProcesandoState(Proceso.Recuperar);

      //deberia preguntar si existe pero solo valida si es vacio o tiene contenido
      if (event.id.trim() == "") {
        yield RecuperadoState(false, Product.inicializar());
      } else {
        final product = await productService.getProduct(event.id);
        yield RecuperadoState(true, product);
      }
    }
  }
}
