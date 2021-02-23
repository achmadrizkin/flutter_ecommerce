import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  String productName;
  String stock;
  String details;
  String price;
  String imageUrl;
  String productCondition;

  ProductDetails(
      {this.productName,
      this.stock,
      this.details,
      this.price,
      this.imageUrl,
      this.productCondition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PoppinsMed',
                          fontSize: 20.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Stock: ' + stock + '  •  ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'PoppinsReg')),
                            WidgetSpan(
                                child: Icon(Icons.star_sharp,
                                    color: Colors.yellowAccent)),
                            TextSpan(
                                text: ' 4.9' + '  •  ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'PoppinsReg')),
                            TextSpan(
                                text: 'Condition: ' + productCondition,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'PoppinsReg')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text('€ ' + price,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'PoppinsBold',
                          fontSize: 26.0)),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text('Details',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'PoppinsMed')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(details,
                      maxLines: 30,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'PoppinsReg')),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FlatButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width / 2.3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.deepOrange,
                      onPressed: () {},
                      child: Text("+ Add to cart",
                          style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              color: Colors.white,
                              fontSize: 16)),
                    ),
                    FlatButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width / 2.3,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.deepOrange,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.white,
                      onPressed: () {},
                      child: Text("Buy Products",
                          style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              color: Colors.deepOrange,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
