import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  // Google Login
  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      print('googleUser');
      print(googleUser);
      // googleUser:
      // GoogleSignInAccount:{displayName, email, id, photoUrl, serverAuthCode: null}
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      print('googleAuth');
      print(googleAuth);
      // googleAuth:
      // GoogleSignInAuthentication:Instance of 'GoogleSignInTokenData'

      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('authCredential');
      print(authCredential);
      // authCredential
      // AuthCredential(providerId: google.com, signInMethod: google.com, token: null, idToken: ``, accessToken: ``)

      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      print('ERROR... login exception [google]');
      print(e);
      // handle error
    }
  }

  // Anonymous Login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print('ERROR... login exception [anonymous]');
      print(e);
      // handle error
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
