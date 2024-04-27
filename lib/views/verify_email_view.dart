import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/background_image.png"),
            // image: AssetImage("assets/bg_black.png"),

            fit: BoxFit.cover,
          ),
        ),
        child: Center( // Wrap the Column with Center widget,
          child: Column(
            children: [
              SizedBox(height: 60),

              const Text(
                "Please verify your email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[500]!),
                  padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                    (states) =>
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue.withOpacity(0.04);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.12);
                      }
                      return null;
                    },
                  ),
                ),
                child: const Text(
                  "Send Email Verification",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
            ],
          ),
      )
      ),
    );
  }
}
