import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
                child: ListTile(
                    title: Text('Add Product',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PoppinsBold',
                            fontSize: 18)),
                    leading: Icon(Icons.add_shopping_cart,
                        color: Colors.black, size: 24)),
              ),
              SizedBox(height: 10.0),
              Card(
                child: ListTile(
                    title: Text('Add Product',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PoppinsBold',
                            fontSize: 18)),
                    leading: Icon(Icons.add_shopping_cart,
                        color: Colors.black, size: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
