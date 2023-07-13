import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../shared/widgets/text_fields/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            size: Get.height * 0.2,
                          )
                      )
                  ),
                  SizedBox(height: Get.height * .04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "title".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: Get.height * .04),
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
                  SizedBox(height: Get.height * .02),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                      child: Obx((){
                          return CustomTextFormField(
                            prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                            hintText: "password".tr,
                            textInputAction: TextInputAction.done,
                            obscureText: !controller.isViewPassword.value,
                            controller: controller.password,
                            validator: (v) => v!.isEmpty
                                ? 'enterPassword'.tr
                                : v.length < 6
                                ? 'configPassword'.tr
                                : null,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Text('forgotPassword'.tr)
                        ),
                        TextButton(
                            onPressed: controller.setRegisterPage,
                            child: Text('register'.tr)
                        )
                      ],
                    ),
                  ),
                  Obx((){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                      child: ProgressButton(
                        radius:  controller.stateOnlyEmail.value == ButtonState.loading ?
                        50.0 : 20,
                        minWidth: 50.0,
                        progressIndicatorAlignment: MainAxisAlignment.center,
                        stateWidgets: {
                          ButtonState.idle: Text('login'.tr,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
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
                        onPressed: controller.login,
                        state: controller.stateOnlyEmail.value,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
