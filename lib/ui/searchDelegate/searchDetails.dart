import 'package:flutter/material.dart';

class SearchDetails extends StatelessWidget {
  String productName;
  String stock;
  String details;
  String price;
  String imageUrl;
  String productCondition;

  SearchDetails(
      {this.productName,
      this.stock,
      this.details,
      this.price,
      this.imageUrl,
      this.productCondition});
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
          title: Text(productName,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'PoppinsBold'))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 250,
              ),
              Text(productName),
              Text(stock),
              Text(price),
              Text(imageUrl),
              Text(details),
              Text(productCondition ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
