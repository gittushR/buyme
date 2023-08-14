import 'package:flipkart_grid_5/models/product_model.dart';
import 'package:flipkart_grid_5/widgets/top_tiltle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopTitles(title: "Grid5.0", subTitle: ""),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search....",
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.network(e),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Recommended for You",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
              child: GridView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 0.88,
                ),
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  for (final singleProduct in recommendedProducts)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            singleProduct.image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            singleProduct.name,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Price: ${singleProduct.price}",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 45,
                            width: 200,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                side: BorderSide(
                                    width: 2,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              child: const Text("Add to Cart"),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
  "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
];

List<ProductModel> recommendedProducts = [
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '1',
    name: "Item1",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '2',
    name: "Item2",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '3',
    name: "Item3",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '4',
    name: "Item4",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '5',
    name: "Item5",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '6',
    name: "Item6",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '6',
    name: "Item6",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '6',
    name: "Item6",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '6',
    name: "Item6",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
  ProductModel(
    image:
        "https://icons.veryicon.com/png/o/commerce-shopping/icon-of-lvshan-valley-mobile-terminal/home-category.png",
    id: '6',
    name: "Item6",
    price: 1,
    description: "Dummy Text. this is a recommended product",
    isFavourite: false,
    status: 'pending',
  ),
];
