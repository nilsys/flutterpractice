
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<User> signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userDetails = await _firebaseAuth.signInWithCredential(
        credential);
    ProviderDetails providerInfo = new ProviderDetails(userDetails.user.uid);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.user.uid,
      userDetails.user.displayName,
      userDetails.user.photoURL,
      userDetails.user.email,
      providerData,
    );

    print("sssss" + details.userName);
    print('sssssss' + details.userEmail);
    // Navigator.push(
    //   context,
    //   new MaterialPageRoute(
    //     //builder: (context) => new ProfileScreen(detailsUser: details),
    //   ),
    // );
    return userDetails.user;
  }

}
class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
