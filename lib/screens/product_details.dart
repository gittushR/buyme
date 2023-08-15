import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flipkart_grid_5/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        widget.product.isFavourite =
                            !widget.product.isFavourite;
                      });
                    },
                    icon: Icon(widget.product.isFavourite
                        ? Icons.favorite_outline
                        : Icons.favorite),
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
                      if (qty > 0) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      child: const Text("BUY"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kFloatingActionButtonMargin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
