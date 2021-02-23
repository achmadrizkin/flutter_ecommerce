import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedsAdmin extends StatefulWidget {
  @override
  _FeedsAdminState createState() => _FeedsAdminState();
}

class _FeedsAdminState extends State<FeedsAdmin> {
  Widget containerFeed(
      String name, DateTime date, String url, String description) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.blue,
      child: Card(
        child: Column(
          children: [
            Text(name),
            Text(date.toIso8601String()),
            Image.network(
              url,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference feedAdmin = firestore.collection('Feed Admin');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: feedAdmin.orderBy('date', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.docs.length * 2,
                          itemBuilder: (context, int index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];

                            // Date Time Formatter
                            DateTime formattedDate = ds['date'].toDate();

                            return containerFeed(ds['name'], formattedDate,
                                ds['url'], ds['description']);
                          }),
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
    );
  }
}
