import 'dart:io';

import 'package:bill_pay_app/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  final auth = FirebaseAuth.instance;
   File? _image;

  _pickImage() async {
    debugPrint('aaa');
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const LogInPage()));
          }, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)
              ),
              child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                debugPrint('tapppp');
                _pickImage();
                    
              }, child: Text("Picked Photo"),),
              Center(
                child: MaterialButton(
                  color: Colors.black,
                  onPressed: (){
                   
                  }, child: const Text("Post", style: TextStyle(
                    color: Colors.white
                  ),),),
              )
          ],
        ),
      ),
    );
  }
}