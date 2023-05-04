import 'package:bill_pay_app/ui/admin/deatils_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AdminHomePage extends StatefulWidget {
   AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<dynamic> dataGet = [];
  final db = FirebaseFirestore.instance;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home Page"),
      ),
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('bill').snapshots(),
        builder: (_, snapshot){
        if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
               
                return InkWell(
                  onTap: () {
                    print(dataGet.length);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsPage(path: snapshot.data!.docs[index].reference.id,)));
                  },
                  child: ListTile(
                    title: Center(child: Text(snapshot.data!.docs[index].reference.id)),
                  ),
                );
            });
        } else {
        return Text("No data");
        }
      })
    );
  }
}