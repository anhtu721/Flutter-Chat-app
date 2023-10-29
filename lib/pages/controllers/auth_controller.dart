import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/firebase_const.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:flutter_chat_app/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  //controller
  var usernameController = TextEditingController();
  var phoneControllder = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());
  // variables
  var isOtpsent = false.obs;
  var formKey = GlobalKey<FormState>();
  //auth variables
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = '';

  //send otp method
  sendOTP() async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };
    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {}
    };
    phoneCodeSent = (String verificationId, int? resenToken) {
      verificationID = verificationId;
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneControllder.text,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  //verify OTP
  verifyOTP(context) async {
    // ignore: non_constant_identifier_names
    String OTP = '';
    for (var i = 0; i < otpController.length; i++) {
      OTP += otpController[i].text;
    }
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: OTP);
      final User? user =
          (await auth.signInWithCredential(phoneAuthCredential)).user;
      if (user != null) {
        DocumentReference store =
            FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set({
          'id': user.uid,
          'name': usernameController.text,
          'phone': phoneControllder.text,
          'about': '',
          'image_url': '',
        }, SetOptions(merge: true));
        VxToast.show(context, msg: loggedin);
        Get.offAll(() => const HomeScreen(), transition: Transition.downToUp);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
