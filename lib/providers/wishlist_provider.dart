import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavNotifier extends StateNotifier<List<ProductModel>> {
  FavNotifier() : super([]);
  void addToWishList(ProductModel product) {
    state = [...state, product];
  }

  void removeFromWishList(ProductModel product) {
    state = state.where((m) => m.id != product.id).toList();
  }

  bool toggleProFavStatus(ProductModel product) {
    var isProFav = state.contains(product);
    if (isProFav == true) {
      state = state.where((m) => m.id != product.id).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
}

final favProvider = StateNotifierProvider<FavNotifier, List<ProductModel>>(
    (ref) => FavNotifier());
