import 'package:flipkart_grid_5/widgets/top_tiltle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TopTitles(title: "Grid5.0", subTitle: ""),
              TextFormField(
                decoration: InputDecoration(hintText: "Search...."),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
