import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future fireauthentication() async{
    try{
      AuthResult responce = await firebaseAuth.signInAnonymously();
      FirebaseUser user = responce.user;
      return user;
    }catch(e){
      print(e.message());
      return null;
    }

  }

  Future authusingcred(String email,String password) async{
    try{
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e.message);
      return null;
    }
  }

  Future loginwithemailpass(String email,String password) async{

    try{
      AuthResult result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      if(user == null){
        print("no user found");
      }else{
        print("siginin completed");
      }
      return user;
    }catch(e){
      print(e.message);
      return null;
    }

  }

}