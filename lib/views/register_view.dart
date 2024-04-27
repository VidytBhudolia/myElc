import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Register"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email "),
          ),
          TextField(
            controller: _password,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Password "),
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/verify_email/', (_) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    if (kDebugMode) {
                      print('The password provided is too weak.');
                    }
                  } else if (e.code == 'email-already-in-use') {
                    if (kDebugMode) {
                      print('The account already exists for that email.');
                    }
                  } else if (e.code == 'invalid-email') {
                    if (kDebugMode) {
                      print('The email address is badly formatted.');
                    }
                  } else {
                    if (kDebugMode) {
                      print(e.code);
                    }
                  }
                }
              },
              child: const Text("Register"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: const Text('Already ? Login Here!'),
            ),
          )
        ],
      ),
    );
  }
}
