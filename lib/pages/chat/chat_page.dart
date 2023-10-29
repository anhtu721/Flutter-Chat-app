import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(22),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: grayColor,
                    ),
                  ),
                  20.widthBox,
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: bgColor,
                    child: Image.asset(
                      ic_user,
                      color: whiteColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: username.text.color(primaryColor).make(),
                      subtitle: "Last seen ...".text.color(grayColor).make(),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            size: 24,
                            Icons.video_call_rounded,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      10.widthBox,
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            size: 24,
                            Icons.call,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.heightBox,
              SizedBox(
                // height: 200,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Directionality(
                      textDirection:
                          index.isEven ? TextDirection.rtl : TextDirection.ltr,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  index.isEven ? bgColor : primaryColor,
                              child: Image.asset(
                                ic_user,
                                color: whiteColor,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            20.widthBox,
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color:
                                          index.isEven ? bgColor : primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: "Hello, I am a provider..."
                                        .text
                                        .white
                                        .make()),
                              ),
                            ),
                            10.widthBox,
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: "11:00 AM".text.gray400.size(12).make(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: whiteColor,
                            ),
                            border: InputBorder.none,
                            hintText: "Type message here...",
                            hintStyle:
                                TextStyle(fontSize: 14, color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                    20.widthBox,
                    const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.send_rounded,
                        color: whiteColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
