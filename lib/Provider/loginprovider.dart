import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:s/home.dart';
import 'package:s/otp.dart';

class loginProvider extends ChangeNotifier{

  String VerificationId='';

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController phonecontroller =TextEditingController();
  TextEditingController otpcontroller =TextEditingController();
  bool otploader=false;
  void sendotp(BuildContext context) async {
    otploader=true;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phonecontroller.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        otploader=false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => otp(),
            ));
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),

    );

  }
  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpcontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
      } else {
        if (kDebugMode) {
          print("6546");
        }
      }
    });
  }

}