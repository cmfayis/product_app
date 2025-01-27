import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Model/product_model.dart';
import 'package:ecommerce_app/services/localstorege.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductLocalStorage localStorage;
  CartBloc(this.localStorage) : super(CartInitial()) {
    on<AddToCart>((event, emit) async {
      await localStorage.saveProducts([event.productModel]);
    });
    on<FetchData>(
      (event, emit) async {
        final data = await localStorage.getProducts();
        print(data);
        emit(ProductLoaded(data));
      },
    );
  }
}
