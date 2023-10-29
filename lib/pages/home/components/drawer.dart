import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/firebase_const.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:flutter_chat_app/pages/profile/profile_page.dart';
import 'package:flutter_chat_app/pages/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: secondaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(25),
      ),
    ),
    child: Column(
      children: [
        20.heightBox,
        ListTile(
          leading: const Icon(setttingsIcon),
          title: settings.text.white.make(),
        ),
        20.heightBox,
        CircleAvatar(
          radius: 45,
          backgroundColor: primaryColor,
          child: Image.asset(
            ic_user,
            color: Colors.white,
          ),
        ),
        10.heightBox,
        "Username".text.make(),
        20.heightBox,
        const Divider(
          color: primaryColor,
          height: 0.5,
        ),
        ListView(
          shrinkWrap: true,
          children: List.generate(
            drawerListIcon.length,
            (index) => ListTile(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(() => const ProfileScreen());
                    break;
                  default:
                }
              },
              leading: Icon(
                drawerListIcon[index],
                color: primaryColor,
              ),
              title: drawerListTitle[index].text.make(),
            ),
          ),
        ),
        const Spacer(),
        ListTile(
          onTap: () async {
            await auth.signOut();
            Get.offAll(() => const WelcomePage());
          },
          leading: const Icon(
            logoutIcon,
            color: primaryColor,
          ),
          title: logout.text.make(),
        ),
      ],
    ),
  );
}
