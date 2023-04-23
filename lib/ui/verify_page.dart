import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class VerifyPage extends StatefulWidget {
  String ?id;
  VerifyPage({super.key, this.id});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController _code = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const Text("Verify Your Phone Number", style: TextStyle(
              fontSize: 26,
      
            ),),
            const SizedBox(height: 20,),
            TextFormField(
                    controller: _code,
                    decoration: const InputDecoration(
                      hintText: '+880 Phone Number',
                      prefixIcon: Icon(Icons.call),
                      
                    ),
                ),
            const SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  // ignore: unused_local_variable
                  final credential = PhoneAuthProvider.credential(verificationId: widget.id.toString(), smsCode: _code.text.toString());
                  try{
                    auth.signInWithCredential(credential);
                  }catch(e){
                    debugPrint(e.toString());
                  }
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
                      children: const[
                        Icon(Icons.onetwothree_outlined, color: Colors.white,),
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