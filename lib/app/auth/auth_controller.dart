import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../shared/models/user_model.dart';
import 'auth_repository.dart';

class AuthController extends GetxController{

  UserModel? userLogged;

  final AuthRepository _authRepository;
  AuthController(this._authRepository);

  @override
  void onInit()async{
    await getUserLogged();
    super.onInit();
  }

  signOut(){
    Get.offAllNamed('login');
    userLogged = null;
    _authRepository.signOut();
  }

  Future<void> loginByEmail(String email,String password)async{
    userLogged = await _authRepository.loginByEmail(email,password);
  }

  Future<void> setRegister(UserModel newUser,String senha)async{
    userLogged = await _authRepository.setRegister(newUser,senha);
  }

  Future<void> getUserLogged()async{
    userLogged = await _authRepository.getUserLogged();
    if(userLogged != null){
      Get.offAllNamed('/home');
      FlutterNativeSplash.remove();
    }else{
      FlutterNativeSplash.remove();
    }
  }

}