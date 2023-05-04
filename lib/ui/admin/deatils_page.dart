import 'package:bill_pay_app/services/firebase_reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  String path;
   DetailsPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('bill').doc(path.toString()).snapshots(),
        builder: (_, snapshot){
        if (snapshot.hasData) {
          print(path.toString());
        return ListTile(
                  title: Text(snapshot.data!.get("id")),
                  subtitle: Text(snapshot.data!.get("bill")),
                  
                );
        } else {
        return Text("No data");
        }
      })
    );
  }
}