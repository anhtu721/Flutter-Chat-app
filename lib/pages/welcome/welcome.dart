import 'package:flutter/material.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/images.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:flutter_chat_app/pages/signin/signin_page.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    logo,
                    width: 120,
                    color: primaryColor,
                  ),
                  appname.text.size(32).color(primaryColor).make(),
                ],
              ),
            ),
            Expanded(
              child: Wrap(
                spacing: 10,
                children: List.generate(listOfFeatures.length, (index) {
                  return Chip(
                    labelPadding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    backgroundColor: Colors.transparent,
                    label: listOfFeatures[index].text.make(),
                    side: const BorderSide(
                      color: Vx.gray400,
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SinginScreen(),
                            transition: Transition.downToUp);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(12),
                      ),
                      child: cont.text
                          .size(16)
                          .color(Colors.white)
                          .semiBold
                          .make(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  poweredby.text.size(12).semiBold.make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
