import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../shared/models/user_model.dart';

class AuthRepository extends GetConnect{

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel?> getUserLogged()async{
    try{
      User? user = auth.currentUser;
      return await getUserByEmail(user!.email);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut()async{
    auth.signOut();
  }

  Future<UserModel?> loginByEmail(String email,String password)async{
    try{
      UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      return await getUserByEmail(user.user!.email);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<UserCredential?> getRegisterAuth(String email,String password)async{
    UserCredential newUser;
    try{
      newUser = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return newUser;
    }catch(e){
      if(e.toString().contains('The email address is already in use by another account')){
        // Get.snackbar('erro', 'Email já está sendo usado por outro usuário',
        //     colorText: Colors.red,
        //     backgroundColor: Colors.white);
      }
      return null;
    }
  }

  Future<UserModel?> setRegister(UserModel newUser,String senha)async{
    UserCredential? user = await getRegisterAuth(newUser.email!, senha);
    if(user == null){
      return null;
    }else{
      DocumentSnapshot? users = await firebase.collection('users').doc(newUser.email!).get();
      if(users.data() == null){
        await getSaveUser(newUser);
        return await getUserByEmail(newUser.email);
      }else{
        auth.signOut();
        return null;
      }
    }
  }


  Future<UserModel?> getUserByEmail(String? email)async{
    try{
      UserModel? user = await firebase.collection('users').doc(email!).get().then((user) {
        return UserModel.fromFirebase(user);
      });
      return user;
    }catch(e){
      print(e.toString());
      auth.signOut();
      return null;
    }
  }

  getSaveUser(UserModel newUser)async{
    try{
      firebase.collection('users').doc(newUser.email).set(newUser.toJson());
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}