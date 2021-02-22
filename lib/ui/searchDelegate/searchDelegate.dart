import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommers/ui/searchDelegate/searchDetails.dart';

class ProductSearch extends SearchDelegate<String> {
  final CollectionReference allProductFood =
      FirebaseFirestore.instance.collection('allProduct');

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear, color: Colors.black),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          close(context, null);
          // Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return StreamBuilder<QuerySnapshot>(
      stream: (query.trim() == '')
          ? allProductFood.snapshots()
          : allProductFood
              .where('searchIndex', arrayContains: query)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return ListTile(
                    title: Text('${ds['name']}'),
                    subtitle: Text('${ds['stock']}'),
                    leading: Text('${ds['price']}'),
                  );
                }),
          );
        } else {
          return Text('Null');
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return StreamBuilder<QuerySnapshot>(
      stream: (query.trim() == '')
          ? allProductFood.snapshots()
          : allProductFood
              .where('searchIndex', arrayContains: query)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchDetails(
                                productName: ds['name'],
                                price: ds['price'],
                                stock: ds['stock'],
                                imageUrl: ds['url'],
                                details: ds['description'],
                                productCondition: ds['condition'],
                              )));
                    },
                    child: ListTile(
                      title: Text('${ds['name']}'),
                      subtitle: Text('${ds['stock']}'),
                      leading: Text('${ds['price']}'),
                    ),
                  );
                }),
          );
        } else {
          return Text('Null');
        }
      },
    );
  }
}
