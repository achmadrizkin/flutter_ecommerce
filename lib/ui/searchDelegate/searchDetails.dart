import 'package:flutter/material.dart';

class SearchDetails extends StatelessWidget {
  String name;
  String stock;
  String details;
  String price;
  String imageUrl;

  SearchDetails(
      {this.name, this.stock, this.details, this.price, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(name),
            Text(stock),
            Text(price),
            Text(imageUrl),
            Text(details),
          ],
        ),
      ),
    );
  }
}
