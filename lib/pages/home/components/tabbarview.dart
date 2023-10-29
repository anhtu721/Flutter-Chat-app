import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/home/components/chats_component.dart';
import 'package:flutter_chat_app/pages/home/components/status_components.dart';

Widget tabbarview() {
  return Expanded(
    child: TabBarView(
      children: [
        Container(
          child: chatsComponent(),
        ),
        Container(
          child: statusComponent(),
        ),
        Container(
          color: Colors.red,
        )
      ],
    ),
  );
}
