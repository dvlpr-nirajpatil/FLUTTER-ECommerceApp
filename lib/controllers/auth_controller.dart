import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';

class AuthController extends GetxController {
  var is_loading = false.obs;

  //login method

  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  // stroing data method

  storeUserData({name, email, password}) async {
    DocumentReference store =
        firestore.collection(userCollections).doc(user!.uid);

    store.set({
      "name": name,
      "password": password,
      "email": email,
      "imageUrl": '',
      "id": user!.uid
    });
  }

  signInWithGoogle() async {
    await auth.signInWithPopup(GoogleAuthProvider());
  }
}
