import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'admin_home_page.dart';
class AdminLogInPage extends StatefulWidget {
  const AdminLogInPage({super.key});

  @override
  State<AdminLogInPage> createState() => _AdminLogInPageState();
}

class _AdminLogInPageState extends State<AdminLogInPage> {
  bool loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void adminLogIn()async{
    await FirebaseFirestore.instance.collection("admin").doc('adminLogIn').snapshots().forEach((element) {
        if(element.data()?['email'] == _emailController.text.toString() && element.data()?['password']== _passwordController.text.toString()){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AdminHomePage()), (route) => false);
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200,),
              const Text("Login", style: TextStyle(
                fontSize: 35,
              ),),
              TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    
                  ),
              ),
              const SizedBox(
                height: 15,
              ),
               TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    
                  ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                 adminLogIn();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: loading == false ? const Text("Login", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),): const CircularProgressIndicator(),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}