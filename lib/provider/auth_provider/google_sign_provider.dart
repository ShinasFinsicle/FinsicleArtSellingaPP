import 'package:add/functions/alert_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  bool loading = false;
  loadingchanger() {
    loading = !loading;
    notifyListeners();
  }

  GoogleSignInAccount get user => _user!;
  Future googleLogin1(context) async {
    // showspinnering(true);
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      // showspinnering(false);
    } catch (e) {
      AlertPopup.alertPopup(context,
          message: "Please Check Your Internet Connection",
          color: Colors.red,
          icon: Icons.exit_to_app);
    }
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
