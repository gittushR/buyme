import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flipkart_grid_5/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistItem extends StatefulWidget {
  const WishlistItem({super.key, required this.product});
  final ProductModel product;

  @override
  State<WishlistItem> createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Routes.instance
              .push(ProductDetails(product: widget.product), context);
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.product.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      widget.product.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite)),
                        const SizedBox(width: 12),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_shopping_cart)),
                        const SizedBox(width: 12),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
