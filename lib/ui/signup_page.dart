import 'package:bill_pay_app/ui/login_page.dart';
import 'package:bill_pay_app/ui/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void signUp(){
    _auth.createUserWithEmailAndPassword(
                      email: _emailController.text.toString(), 
                      password: _passwordController.text.toString()).then((value) {
                        
                      },).onError((error, stackTrace) {
                        ToastMessage().toastMessage(error.toString());
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
              const Text("SignUp", style: TextStyle(
                fontSize: 35,
              ),),
              Form(
                key: _formKey,
                child: Column(
                children: [
                    TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    
                  ),
                  validator: (value) {
                    if(value == null){
                      return 'empty email';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if(value == null){
                      return "password empty";
                    }
                    if(value.length <= 6){
                      return "Must be at least 6 character";
                    }
                    return null;
                  },
              ),
                ],
              )),
            
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                    if(_formKey.currentState!.validate()){
                        signUp();
                    }
                  
                 
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text("SignUp", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Did have account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const LogInPage()));
                  }, child: const Text("LogIn", style: TextStyle(
                    color: Colors.deepPurple,
                  ),))
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}