import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/strings.dart';

Widget tabbar() {
  return const TabBar(
    tabs: [
      Tab(
        text: chats,
      ),
      Tab(
        text: status,
      ),
      Tab(
        text: camera,
      ),
    ],
  );
}
