import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("Home"),automaticallyImplyLeading: false,),
      body: Center(child: Container(height: 50,width: 200,color: Colors.teal,child: Center(child: Text("Authentication Succesfully")))),
    );
  }
}
