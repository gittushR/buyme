import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<ProductModel>> {
  CartNotifier() : super([]);
  void addToCart(ProductModel productModel) {
    state = [...state, productModel];
  }

  void removeFromCart(ProductModel productModel) {
    state = state.where((element) => element.id != productModel.id).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<ProductModel>>(
    (ref) => CartNotifier());
