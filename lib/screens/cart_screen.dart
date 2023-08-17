import 'package:flipkart_grid_5/constants/asset_images.dart';
import 'package:flipkart_grid_5/providers/cart_provider.dart';
import 'package:flipkart_grid_5/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = ref.watch(cartProvider);
    if (cart.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsImages.instance.emptyCart,
                scale: 5,
              ),
              const SizedBox(height: 20),
              const Text(
                "Cart is empty!!! \nStart Adding your favorite products to cart",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, ind) {
            return CartItem(
              product: cart[ind],
            );
          },
        ),
        bottomNavigationBar: const SizedBox(
          height: kBottomNavigationBarHeight,
        ),
      );
    }
  }
}

/*// Image.network(
                  //   "https://www2.shutterstock.com/blog/wp-content/uploads/sites/5/2016/03/fall-trees-road-1.jpg",
                  //   height: 50,
                  //   width: 50,
                  //   fit: BoxFit.cover,
                  // ),
                  // const SizedBox(width: 12),
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Product Name",
                  //         style: const TextStyle(
                  //             fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //       const SizedBox(height: 12),
                  //       Text(
                  //         "Product Description",
                  //         style: const TextStyle(
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       const SizedBox(height: 12),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             "Rs. 1000",
                  //             style: const TextStyle(
                  //                 fontSize: 18, fontWeight: FontWeight.bold),
                  //           ),
                  //           Row(
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () {},
                  //                 icon: const Icon(Icons.remove),
                  //               ),
                  //               Text(
                  //                 "1",
                  //                 style: const TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               IconButton(
                  //                 onPressed: () {},
                  //                 icon: const Icon(Icons.add),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ), */
