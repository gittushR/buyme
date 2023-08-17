import 'package:flipkart_grid_5/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flipkart_grid_5/providers/wishlist_provider.dart';

import '../constants/asset_images.dart';

class WishlistScreen extends ConsumerStatefulWidget {
  const WishlistScreen({super.key});

  @override
  ConsumerState<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    var wishList = ref.watch(favProvider);
    Widget content = ListView.builder(
      itemCount: wishList.length,
      itemBuilder: (ctx, index) => WishlistItem(product: wishList[index]),
    );
    if (wishList.isEmpty) {
      content = Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.instance.emptyWishlist,
              scale: 2,
            ),
            const SizedBox(height: 20),
            const Text(
              "Your Wishlist is empty!!! \nStart Adding your favorite products here!!",
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight + 20,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorites"),
      ),
      body: content,
    );
  }
}
