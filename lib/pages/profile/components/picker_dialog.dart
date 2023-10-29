import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

Widget pickerDialog(context, controller) {
  var listTitle = [camera, gallery, cancel];
  var icons = [
    Icons.camera_alt_rounded,
    Icons.photo_size_select_actual_rounded,
    Icons.cancel_rounded
  ];
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.all(12),
      color: bgColor,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        'Upload Image'.text.white.make(),
        const Divider(height: 5),
        10.heightBox,
        ListView(
          shrinkWrap: true,
          children: List.generate(
            3,
            (index) => ListTile(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.back();
                    controller.pickImg(context, ImageSource.camera);
                    break;
                  case 1:
                    Get.back();
                    controller.pickImg(context, ImageSource.gallery);

                    break;
                  case 2:
                    Get.back();
                    break;
                  default:
                }
              },
              leading: Icon(
                icons[index],
                color: whiteColor,
              ),
              title: listTitle[index].text.white.make(),
            ),
          ),
        ),
      ]),
    ),
  );
}
