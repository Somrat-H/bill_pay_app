import 'package:bill_pay_app/ui/home_page.dart';
import 'package:bill_pay_app/ui/phone_login_page.dart';
import 'package:bill_pay_app/ui/signup_page.dart';
import 'package:bill_pay_app/ui/widget/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  //login user their pass and gmail by firebase auth
  void logIn(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
      email: _emailController.text.toString(), 
      password: _passwordController.text.toString()).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()))).onError((error, stackTrace){
        ToastMessage().toastMessage(error.toString());
      });
      setState(() {
        loading = false;
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
                  logIn();
                  ToastMessage().toastMessage("Successfully Login");
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
              InkWell(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> const PhoneLoginPage()));
                  
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
                         Icon(Icons.call, color: Colors.white,),
                         Text("Login With Phone Number", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ],
                    )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't have account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUpPage()));
                  }, child: const Text("Sign Up", style: TextStyle(
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