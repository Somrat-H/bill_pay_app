import 'package:bill_pay_app/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const LogInPage()));
          }, icon: const Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}