import 'package:flutter/material.dart';
import 'package:flutter_ecommers/ui/page-3/addProduct.dart';
import 'package:flutter_ecommers/ui/page-3/addProductAdmin.dart';
import 'package:flutter_ecommers/ui/page-3/myproduct.dart';
import 'package:flutter_ecommers/ui/page-3/transactionHistory.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(child: Icon(Icons.account_circle_rounded, size: 250)),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      color: Color(0xFF016DF7),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Center(
                              child: Icon(Icons.account_circle_rounded,
                                  size: 124, color: Colors.white)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Achmad Rizki',
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 24,
                                    color: Colors.white)),
                            Text('Balance: E5000',
                                style: TextStyle(
                                    fontFamily: 'PoppinsReg',
                                    fontSize: 16,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),

                Card(
                  // child: GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => AddProduct()));
                  //   },
                  child: ListTile(
                      title: Text('Add Product',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsBold',
                              fontSize: 18)),
                      leading: Icon(Icons.add_shopping_cart,
                          color: Colors.black, size: 24)),
                ),
                // ),

                SizedBox(height: 10.0),
                Card(
                  // child: GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => AddProductAdmin()));
                  //   },
                  child: ListTile(
                      title: Text('Add Product',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsBold',
                              fontSize: 18)),
                      subtitle: Text('Admin Only',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PoppinsReg',
                              fontSize: 12)),
                      leading: Center(
                        child: Icon(Icons.add_shopping_cart,
                            color: Colors.black, size: 24),
                      )),
                  // ),
                ),

                SizedBox(height: 10.0),
                Card(
                  // child: GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => TransactionHistory()));
                  //   },
                  child: ListTile(
                      title: Text('Transaction History',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsBold',
                              fontSize: 18)),
                      leading:
                          Icon(Icons.history, color: Colors.black, size: 24)),
                ),
                // ),

                SizedBox(height: 10.0),
                Card(
                  // child: GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //         MaterialPageRoute(builder: (context) => MyProduct()));
                  //   },
                  child: ListTile(
                      title: Text('My Product',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsBold',
                              fontSize: 18)),
                      leading: Icon(Icons.shopping_cart,
                          color: Colors.black, size: 24)),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
