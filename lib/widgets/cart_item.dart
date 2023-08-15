import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
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
              child: Image.network(
                  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 155,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "  Product",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
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
                                if (qty > 0) {
                                  setState(() {
                                    qty--;
                                  });
                                }
                              },
                              icon: const CircleAvatar(
                                maxRadius: 15,
                                child: Icon(Icons.remove_circle),
                              ),
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  qty++;
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
                    const Text(
                      "\$233",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
