import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../auth/auth_controller.dart';
import '../../shared/models/user_model.dart';

class RegisterController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<ButtonState> stateOnlyRegister = ButtonState.idle.obs;

  RxBool isViewPassword = RxBool(false);

  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  RxString photo = RxString('');

  final AuthController _authController;
  RegisterController(this._authController);

  setChangeViewPassword()=> isViewPassword.value = !isViewPassword.value;

  Future register()async{
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (formKey.currentState!.validate()) {
      stateOnlyRegister.value = ButtonState.loading;
      await _authController.setRegister(
          UserModel(
              uid: email.text,
              name: name.text,
              email: email.text,
          ),password.text
      );
      if(_authController.userLogged == null){
        stateOnlyRegister.value = ButtonState.fail;
        Timer(const Duration(seconds: 2),(){
          stateOnlyRegister.value = ButtonState.idle;
        });
      }else{
        stateOnlyRegister.value = ButtonState.success;
        Timer(const Duration(seconds: 2),(){
          Get.offAllNamed('/home');
          stateOnlyRegister.value = ButtonState.idle;
        });
      }
    }
  }


}