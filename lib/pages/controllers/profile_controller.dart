import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/const/firebase_const.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var aboutController = TextEditingController();

  //variables image
  var imagepath = ''.obs;
  var imglink = '';

  //update profile
  updateProfile(context) async {
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);
    store.set({
      'name': nameController.text,
      'about': aboutController.text,
      'image_url': imglink,
    }, SetOptions(merge: true));

    //show toast when done
    VxToast.show(context, msg: "Profile updated successfully!");
  }

  // image method
  pickImg(context, source) async {
    await Permission.photos.request();
    await Permission.camera.request();

    var status = await Permission.photos.status;

    if (status.isGranted) {
      try {
        final img =
            await ImagePicker().pickImage(source: source, imageQuality: 80);
        imagepath.value = img!.path;
        VxToast.show(context, msg: 'Image selected');
      } on PlatformException catch (e) {
        VxToast.show(context, msg: e.toString());
      }
    } else {
      VxToast.show(context, msg: 'Permission denied');
    }
  }

  uploadImage() async {
    var name = basename(imagepath.value);
    var destination = 'image/${currentUser!.uid}/$name';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imagepath.value));
    var d = await ref.getDownloadURL();
    imglink = d;
  }
}
