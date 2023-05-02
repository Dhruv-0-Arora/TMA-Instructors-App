import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tma_instructors/Pages/home_screen.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SignInView> {
  static Future<User?> loginUsingEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User Not Found for that email");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 200,
                        ),
                      ))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260),
            child: Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                  // TODO: navigate to create account area
                },
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 285),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const TextField(
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.mail_outline,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey)),
                            )))
                  ])),
          Padding(
              padding: const EdgeInsets.only(top: 360),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const TextField(
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey)),
                            )))
                  ])),
          Padding(
            padding: const EdgeInsets.only(top: 440),
            child: Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onTap: () {
                  // TODO: navigate to reset password screen
                },
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 470),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: RawMaterialButton(
                    onPressed: () => {},
                    fillColor: Colors.red,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                  ))),
        ],
      ),
    );
  }
}
