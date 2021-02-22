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

  Widget containerProduct(String nameProduct, String priceProduct) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Card(
        child: Column(
          children: [
            //TODO: ADD FUCKING IMAGE
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nameProduct),
                Text('E200'),
              ],
            ),
            Text(priceProduct),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference productFood = firestore.collection('Food');

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
                  text: 'Flutter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'E-Commerce',
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
                //TODO: ADD FKING SEARCH
                showSearch(context: context, delegate: ProductSearch());

                // setState(() {
                //   searchIndicator = !searchIndicator;
                // });
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
                                color: Colors.red,
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
                              onTap: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                      builder: (context) => new ProductDetails(
                                            nameProduct: '${ds['name']}',
                                            emailsProduct: '${ds['email']}',
                                          ))),
                              child: containerProduct(
                                  '${ds['name']}', 'Email: ${ds['email']}'),
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
                                color: Colors.red,
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
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, int index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];

                            return containerProduct(
                                '${ds['name']}', 'Email: ${ds['email']}');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
