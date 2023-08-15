import 'package:flipkart_grid_5/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, ind) {
          return const CartItem();
        },
      ),
    );
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
