import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommers/ui/page-1/flashSale.dart';
import 'package:flutter_ecommers/ui/page-1/productDetails.dart';
import 'package:flutter_ecommers/ui/page-1/shoppingCart.dart';
import 'package:flutter_ecommers/ui/page-1/specialDiscount.dart';
import 'package:flutter_ecommers/ui/searchDelegate/searchDelegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchProductController = TextEditingController();

  Widget containerProduct(String nameProduct, String priceProduct,
      String imageUrl, String stockProduct, String productCondition) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(nameProduct,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PoppinsMed',
                      fontSize: 16.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                  'Stock: ' +
                      stockProduct +
                      '  •  ' +
                      'Condition: ' +
                      productCondition,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'PoppinsReg',
                      fontSize: 10.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                '€ ' + priceProduct,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'PoppinsBold',
                    fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    //TODO: change this in future
    final CollectionReference productFood = firestore.collection('allProduct');

    //
    final db = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'V6',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Store',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF016DF7),
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
              icon: Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.black)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF016DF7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Flash Sale",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'PoppinsMed')),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FlashSale()));
                        },
                        child: Text("Show All Product",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'PoppinsMed')),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: productFood.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, int index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];

                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                  builder: (context) => new ProductDetails(
                                    productName: ds['name'],
                                    price: ds['price'],
                                    stock: ds['stock'],
                                    imageUrl: ds['url'],
                                    details: ds['description'],
                                    productCondition: ds['condition'],
                                  ),
                                ),
                              ),
                              child: containerProduct(
                                  '${ds['name']}',
                                  '${ds['price']}',
                                  ds['url'],
                                  ds['stock'],
                                  ds['condition']),
                            );
                            // return Container(
                            //   child: Column(
                            //     children: [
                            //       Text('Name: ${ds['name']}'),
                            //       Text('Balance: ${ds['balance']}'),
                            //       Text('Email: ${ds['email']}'),
                            //     ],
                            //   ),
                            // );
                          },
                        ),
                      );
                    } else {
                      return Text("");
                    }
                  },
                ),
                //TODO: Special Discount
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Special Discount",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'PoppinsMed')),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SpecialDiscount()));
                        },
                        child: Text("Show All Product",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'PoppinsMed')),
                      ),
                    ],
                  ),
                ),
                //   StreamBuilder<QuerySnapshot>(
                //     stream: productFood.snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Container(
                //           width: double.infinity,
                //           height: MediaQuery.of(context).size.height / 3.5,
                //           child: ListView.builder(
                //             shrinkWrap: true,
                //             scrollDirection: Axis.horizontal,
                //             itemCount: snapshot.data.docs.length,
                //             itemBuilder: (context, int index) {
                //               DocumentSnapshot ds = snapshot.data.docs[index];

                //               return containerProduct(
                //                   '${ds['name']}', 'Email: ${ds['email']}');
                //               // return Container(
                //               //   child: Column(
                //               //     children: [
                //               //       Text('Name: ${ds['name']}'),
                //               //       Text('Balance: ${ds['balance']}'),
                //               //       Text('Email: ${ds['email']}'),
                //               //     ],
                //               //   ),
                //               // );
                //             },
                //           ),
                //         );
                //       } else {
                //         return Text("");
                //       }
                //     },
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
