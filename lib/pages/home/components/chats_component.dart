import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/pages/chat/chat_page.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatsComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Get.to(() => const ChatPage(), transition: Transition.downToUp);
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: primaryColor,
              child: Image.asset(
                ic_user,
                color: Colors.white,
              ),
            ),
            title: 'NameChatting'.text.size(16).semiBold.make(),
            subtitle: 'Messaging...'.text.size(14).semiBold.make(),
            trailing: '2 minutes ago'.text.gray400.make(),
          ),
        );
      },
    ),
  );
}
