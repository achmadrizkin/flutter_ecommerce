import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  String nameProduct;
  String emailsProduct;
  ProductDetails({this.nameProduct, this.emailsProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          nameProduct,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [Text(nameProduct), Text(emailsProduct)],
      ),
    );
  }
}
