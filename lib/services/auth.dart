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
      // GoogleSignInAccount:{displayName: Dave Degeatano, email: dave@slash.co, id: 104623972310985216270, photoUrl: https://lh3.googleusercontent.com/a-/AOh14GgEo5HE6P6lo0WjENziEYJ1rkezj03Qjc6x0_8w=s1337, serverAuthCode: null}
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
      print(e);
      // handle error
    }
  }

  // Anonymous Login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e);
      // handle error
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
