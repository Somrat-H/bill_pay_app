import 'dart:async';
import 'package:bill_pay_app/ui/home_page.dart';
import 'package:bill_pay_app/ui/login_page.dart';
import 'package:bill_pay_app/ui/verify_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class FirebaseService{
    final auth = FirebaseAuth.instance;


    //chceked user is logged or not. if log then godirect homescreen or go login screen
    void loggedIn(BuildContext context){
     
        User? user = auth.currentUser;
   
    if(user != null){
      Timer(const Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()));
    });
    } 
    if(user == null){
       Timer(const Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (_)=> const LogInPage()));
    });
    }
  }
  
  //log in with phone and verify phone number by seding otp or token
  void verfiyPhone(TextEditingController phoneNumberController, BuildContext context){

    auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text.toString(),
      verificationCompleted: (v){}, 
      verificationFailed: (e){
        
      }, 
      codeSent: (String id, int ?token){
         Navigator.push(context, MaterialPageRoute(builder: (_)=> VerifyPage(id: id)));
      }, 
      codeAutoRetrievalTimeout: (e){
        
      });
  }
}