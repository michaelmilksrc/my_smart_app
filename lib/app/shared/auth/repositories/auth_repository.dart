import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();

  @override
  Future getEmailEndPasswordLogin(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  @override
  Future getGoogleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignin.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Future<String> getToken() {
    return Future(() => "");
  }

  @override
  Future getUser() async {
    return _auth.currentUser;
  }

  @override
  Future logOut() async {
    await _auth.signOut();
    await _googleSignin.signOut();
  }
}
