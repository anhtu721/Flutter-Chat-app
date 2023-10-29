import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/const/colors.dart';
import 'package:flutter_chat_app/const/strings.dart';
import 'package:flutter_chat_app/pages/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SinginScreen extends StatelessWidget {
  const SinginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: letConnect.text.black.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //user field
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400),
                      ),
                      prefixIcon: const Icon(
                        Icons.person_2_rounded,
                        color: Vx.gray600,
                      ),
                      alignLabelWithHint: true,
                      labelText: 'Username',
                      hintText: 'eg: Alexx',
                      labelStyle: const TextStyle(
                        color: Vx.gray600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  12.heightBox,
                  //phone field
                  TextFormField(
                    controller: controller.phoneControllder,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 9) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Vx.gray400),
                      ),
                      prefixIcon: const Icon(
                        Icons.phone_android_rounded,
                        color: Vx.gray600,
                      ),
                      alignLabelWithHint: true,
                      labelText: 'Phone Number',
                      hintText: 'eg: +8431231231',
                      labelStyle: const TextStyle(
                        color: Vx.gray600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  12.heightBox,
                  otp.text.semiBold.size(16).make(),
                ],
              ),
            ),
            //OTP Field

            Obx(
              () => Visibility(
                visible: controller.isOtpsent.value,
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 56,
                        child: TextField(
                          controller: controller.otpController[index],
                          cursorColor: primaryColor,
                          onChanged: (value) {
                            if (value.length == 1 && index < 5) {
                              Focus.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              Focus.of(context).previousFocus();
                            }
                          },
                          maxLength: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: bgColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: bgColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.isOtpsent.value == false) {
                      controller.isOtpsent.value = true;
                      await controller.sendOTP();
                    } else {
                      controller.verifyOTP(context);
                    }
                  }

                  // Get.to(() => const HomePage(),
                  //     transition: Transition.downToUp);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(12),
                ),
                child: continueText.text
                    .size(16)
                    .color(Colors.white)
                    .semiBold
                    .make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
