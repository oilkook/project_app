import 'package:google_sign_in/google_sign_in.dart';

class ActionLogin {
  loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]);
      GoogleSignInAccount user = await googleSignIn.signIn();
      // final res = await googleSignIn.signIn();
      print(user.displayName);
    } catch (err) {
      print(err);
    }
  }
}
