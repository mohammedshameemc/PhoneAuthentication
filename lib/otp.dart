import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:s/Provider/loginprovider.dart';
import 'package:s/home.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text("Otp Screen"),),

      body: SingleChildScrollView(
        child: Consumer<loginProvider>(
          builder: (context,val,child) {
            return Column(children: [
              SizedBox(height: 70,),

              Container(height: 180,width: 180,child: Image.asset("assets/promotion_nootify.png")),
              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Pinput(
                controller: val.otpcontroller,
                length: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                    textStyle:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                    height: 55,
                    width: 40,
                    decoration: BoxDecoration( color:Colors.teal.shade100,boxShadow: [
                      BoxShadow(color: Colors.white30,

                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      ),
                    ], borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1,
                            color:Colors.white.withOpacity(0.9)))),

                onCompleted: (pin){
                  // value.verify(context);

                },
                      ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.teal) ),onPressed: () {
                val.verify(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));

              }, child: Text("Submit",style: TextStyle(color: Colors.white),))

            ],);
          }
        ),
      ),


    );
  }
}
