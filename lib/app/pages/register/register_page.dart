import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../shared/utils/assets.dart';
import '../../shared/widgets/text_fields/custom_text_form_field.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black87
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                      tag: "logo",
                      child: ClipRRect(
                          child: FlutterLogo(
                            size: Get.height * 0.15,
                          )
                      )
                  ),
                  SizedBox(height: Get.height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                    child: CustomTextFormField(
                      prefixIcon: const Icon(Icons.email,color: Colors.grey,),
                      hintText: "email".tr,
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'informEmail'.tr;
                        } else if (!GetUtils.isEmail(value.toString())) {
                          return 'invalidEmail'.tr;
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: Get.height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                    child: CustomTextFormField(
                      prefixIcon: const Icon(Icons.person,color: Colors.grey,),
                      hintText: "name".tr,
                      controller: controller.name,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'informName'.tr;
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: Get.height * .01),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                      child: Obx((){
                          return CustomTextFormField(
                            prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                            hintText: "password".tr,
                            obscureText: !controller.isViewPassword.value,
                            controller: controller.password,
                            validator: (v) => v!.isEmpty
                                ? 'enterPassword'.tr
                                : v.length < 6
                                ? 'configPassword'.tr
                                : null,
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              icon: !controller.isViewPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: controller.setChangeViewPassword,
                            ),
                          );
                        }
                      )
                  ),
                  SizedBox(height: Get.height * .01),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                      child: Obx((){
                          return CustomTextFormField(
                            prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                            hintText: "password".tr,
                            textInputAction: TextInputAction.done,
                            obscureText: !controller.isViewPassword.value,
                            validator: (v) => v!.isEmpty
                                ? 'enterPassword'.tr
                                : v != controller.password.text
                                ? 'repetPassword'.tr
                                : null,
                            suffixIcon: IconButton(
                              icon: !controller.isViewPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: controller.setChangeViewPassword,
                            ),
                          );
                        })
                  ),
                  SizedBox(height: Get.height * .03),
                  Obx((){
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                        child: ProgressButton(
                          radius:  controller.stateOnlyRegister.value == ButtonState.loading ?
                          50.0 : 20.0,
                          minWidth: 50.0,
                          progressIndicatorAlignment: MainAxisAlignment.center,
                          stateWidgets: {
                            ButtonState.idle: Text('register'.tr,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                            ButtonState.loading: Container(),
                            ButtonState.fail: Text('fail'.tr,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                            ButtonState.success: Text('logged'.tr,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                          },
                          stateColors: {
                            ButtonState.idle: Get.theme.primaryColor,
                            ButtonState.loading: Get.theme.primaryColor,
                            ButtonState.fail: Colors.redAccent,
                            ButtonState.success: Colors.green,
                          },
                          onPressed: controller.register,
                          state: controller.stateOnlyRegister.value,
                        )
                    );
                  }),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
