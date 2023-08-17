import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flipkart_grid_5/providers/cart_provider.dart';
import 'package:flipkart_grid_5/providers/wishlist_provider.dart';
import 'package:flipkart_grid_5/screens/cart_screen.dart';
import 'package:flipkart_grid_5/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    var favProduct = ref.watch(favProvider);
    final isFav = favProduct.contains(widget.product);
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product.name),
          actions: [
            IconButton(
              onPressed: () {
                Routes.instance.push(const CartScreen(), context);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.image,
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      final wasAdded = ref
                          .read(favProvider.notifier)
                          .toggleProFavStatus(widget.product);
                      setState(() {
                        widget.product.isFavourite = wasAdded;
                      });
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(wasAdded
                            ? "Added to Favorites"
                            : "Removed from Favorites"),
                        duration: const Duration(seconds: 5),
                      ));
                      // print(widget.product.isFavourite);
                    },
                    icon: AnimatedSwitcher(
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: Tween<double>(
                          begin: 0.5,
                          end: 1,
                        ).animate(animation),
                        child: child,
                      ),
                      duration: const Duration(milliseconds: 300),
                      child:
                          Icon(isFav ? Icons.favorite : Icons.favorite_outline),
                    ),
                  )
                ],
              ),
              Text(widget.product.description),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (qty > 1) {
                        setState(() {
                          qty--;
                        });
                      }
                    },
                    icon: const CircleAvatar(
                      child: Icon(Icons.remove_circle),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    icon: const CircleAvatar(
                      child: Icon(Icons.add_circle),
                    ),
                  )
                ],
              ),
              const Spacer(),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Added to cart"),
                          ),
                        );
                        ref.read(cartProvider.notifier).addToCart(
                              ProductModel(
                                  image: widget.product.image,
                                  id: uuid.v1(),
                                  name: widget.product.name,
                                  price: widget.product.price,
                                  description: widget.product.description,
                                  isFavourite: isFav,
                                  status: widget.product.status,
                                  qty: qty),
                            );
                      },
                      child: const Text("ADD TO CART"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Routes.instance.push(const WishlistScreen(), context);
                      },
                      child: const Text("BUY"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kBottomNavigationBarHeight + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
