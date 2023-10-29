import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:velocity_x/velocity_x.dart';

Widget statusComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: bgColor,
              child: Image.asset(
                ic_user,
                color: whiteColor,
              ),
            ),
            title: "My status".text.color(txtColor).make(),
            subtitle: "Tap to add status update".text.gray400.make(),
          ),
          20.heightBox,
          recentUpdates.text.color(txtColor).make(),
          20.heightBox,
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Vx.randomPrimaryColor,
                      child: Image.asset(ic_user),
                    ),
                  ),
                  title: username.text.color(txtColor).make(),
                  subtitle: "Today, 8:32 PM".text.gray400.make(),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
