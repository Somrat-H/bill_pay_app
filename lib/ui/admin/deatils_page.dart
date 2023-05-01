import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  dynamic data;
   DetailsPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: ListView.builder(itemBuilder: (_, index){
        return ListTile(
          title: Text(data),
        );
      }),
    );
  }
}