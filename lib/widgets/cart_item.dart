import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flipkart_grid_5/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem({super.key, required this.product});
  final ProductModel product;

  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[200]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 155,
              child: Image.network(widget.product.image),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 155,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  ${widget.product.name}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeFromCart(widget.product);
                            ref
                                .read(favProvider.notifier)
                                .addToWishList(widget.product);
                          },
                          child: const Text(
                            "Add to Wishlist",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (widget.product.qty > 1) {
                                  setState(() {
                                    widget.product.qty--;
                                  });
                                } else if (widget.product.qty == 1) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Removed ${widget.product.name} from cart")));
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeFromCart(widget.product);
                                }
                              },
                              icon: const CircleAvatar(
                                maxRadius: 15,
                                child: Icon(Icons.remove_circle),
                              ),
                            ),
                            Text(
                              widget.product.qty.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  widget.product.qty++;
                                });
                              },
                              icon: const CircleAvatar(
                                maxRadius: 15,
                                child: Icon(Icons.add_circle),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "\$${widget.product.qty * widget.product.price}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
