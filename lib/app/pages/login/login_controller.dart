import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../auth/auth_controller.dart';

class LoginController extends GetxController{

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isViewPassword = RxBool(false);

  Rx<ButtonState> stateOnlyEmail = ButtonState.idle.obs;

  final AuthController _authController;
  LoginController(this._authController);

  setChangeViewPassword()=> isViewPassword.value = !isViewPassword.value;

  setRegisterPage(){
    Get.toNamed('/register');
  }

  Future login()async{
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (formKey.currentState!.validate()) {
      stateOnlyEmail.value = ButtonState.loading;
      await _authController.loginByEmail(email.text,password.text);
      if(_authController.userLogged == null){
        stateOnlyEmail.value = ButtonState.fail;
        Timer(const Duration(seconds: 2),(){
          stateOnlyEmail.value = ButtonState.idle;
        });
      }else{
        stateOnlyEmail.value = ButtonState.success;
        Timer(const Duration(seconds: 2),(){
          Get.offAllNamed('/home');
          stateOnlyEmail.value = ButtonState.idle;
        });
      }

    }
  }

}