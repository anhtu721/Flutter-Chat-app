import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appBar(GlobalKey<ScaffoldState> key) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            color: Colors.white,
            child: const Icon(menuIcon),
          ),
        ),
        SizedBox(
          height: 100,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '$appname\n',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                  ),
                ),
                // TextSpan(
                //   text: '$connectingLive\n',
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Vx.gray600,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: primaryColor,
          radius: 25,
          child: Image.asset(
            ic_user,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
