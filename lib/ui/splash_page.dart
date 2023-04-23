

import 'package:bill_pay_app/services/firebase_service.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
   FirebaseService().loggedIn(context);
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[100],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text("Bill Pay App", style: TextStyle(
              fontSize: 26,
              color: Colors.black54,
            ),),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(),
          ],
        ),
      )
    );
  }
}