import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late final TextEditingController _email;

  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 300,
            height: 300, // Adjust the width as needed
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "Email "),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _password,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password "),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login/', (route) => false);
                    },
                    child: Text('Already have an account? Login!'),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[500]!),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.12);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      print(userCredential);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      } else if (e.code == 'invalid-email') {
                        print('The email address is badly formatted.');
                      } else {
                        print(e.code);
                      }
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
