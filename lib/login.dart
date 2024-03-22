import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:s/Provider/loginprovider.dart';
import 'package:s/otp.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Phone Authentication"),),
      body: SingleChildScrollView(
        child: Consumer<loginProvider>(
          builder: (context,val,child) {
            return Column(
              children: [
                SizedBox(height: 70,),

                Container(height: 180,width: 180,child: Image.asset("assets/support_peersonnel (1).png")),
                SizedBox(height: 100,),
                Center(
                  child: Container(decoration: BoxDecoration(color: Colors.teal.shade200,borderRadius: BorderRadius.circular(10)),height: 50,width: 250,

                    child: TextField(controller:val.phonecontroller ,


                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(labelText: "Phone Number",border: InputBorder.none,contentPadding: EdgeInsets.all(10),suffixIcon: Icon(Icons.phone)),
                    ),
                  ),
                ),
                SizedBox(height: 60,),

                ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.teal) ),onPressed: () {
                  val.sendotp(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => otp(),));

                }, child: Text("login",style: TextStyle(color: Colors.white),))
              ],
            );
          }
        ),
      ),
    );
  }
}
