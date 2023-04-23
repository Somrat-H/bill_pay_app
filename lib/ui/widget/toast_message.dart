import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  
  //reusbale for toastmessage anywhere for use
  toastMessage(String message){
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.tealAccent[100],
      );
  }

}

