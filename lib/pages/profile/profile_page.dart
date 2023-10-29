import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/firebase_const.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:flutter_chat_app/pages/controllers/profile_controller.dart';
import 'package:flutter_chat_app/pages/profile/components/picker_dialog.dart';
import 'package:flutter_chat_app/service/store_service.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: profile.text.bold.white.make(),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () async {
                if (controller.imagepath.isEmpty) {
                  controller.updateProfile(context);
                } else {
                  await controller.uploadImage();
                  // ignore: use_build_context_synchronously
                  controller.updateProfile(context);
                }
              },
              child: 'Save'.text.white.make())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder(
          future: StoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              // set values to the text controller
              controller.nameController.text = data['name'];
              controller.aboutController.text = data['about'];
              controller.phoneController.text = data['phone'];
              return Column(
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 60,
                      backgroundColor: primaryColor,
                      child: Stack(
                        children: [
                          // set image
                          controller.imagepath.isEmpty &&
                                  data['image_url'] == ''
                              ? Image.asset(
                                  ic_user,
                                  color: Colors.white,
                                )
                              : controller.imagepath.isEmpty
                                  ? Image.file(File(controller.imagepath.value))
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(data['image_url'])
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                          Positioned(
                            right: 0,
                            bottom: 20,
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ).onTap(() {
                                Get.dialog(pickerDialog(context, controller));
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: whiteColor,
                    ),
                    title: TextFormField(
                      controller: controller.nameController,
                      style: const TextStyle(
                        color: whiteColor,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: whiteColor,
                        ),
                        label: "Name".text.color(whiteColor).make(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                      color: whiteColor,
                    ),
                    title: TextFormField(
                      controller: controller.aboutController,
                      style: const TextStyle(
                        color: whiteColor,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: whiteColor,
                        ),
                        label: "About".text.color(whiteColor).make(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: whiteColor,
                    ),
                    title: TextFormField(
                      controller: controller.phoneController,
                      style: const TextStyle(
                        color: whiteColor,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        label: "Phone Number".text.color(whiteColor).make(),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(whiteColor),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
