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
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'PoppinsBold'))),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 250,
            ),
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
