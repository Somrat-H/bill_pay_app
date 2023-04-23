import 'package:bill_pay_app/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const Text("Login With Your Phone Number", style: TextStyle(
              fontSize: 26,
      
            ),),
            const SizedBox(height: 20,),
            TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: '+880 Phone Number',
                      prefixIcon: Icon(Icons.call),
                      
                    ),
                ),
            const SizedBox(height: 20,),
            InkWell(
                onTap: (){
                FirebaseService().verfiyPhone(_phoneNumberController, context);
                
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Icon(Icons.call, color: Colors.white,),
                         Text("Confirm", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ],
                    )
                  ),
                ),
              ),
      
          ],
        ),
      ),
    );
  }
}