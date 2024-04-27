import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/firstpage.dart';
import 'package:mynotes/views/home.dart';
import 'package:mynotes/views/login_views.dart';
import 'package:mynotes/views/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';

void main() {
  runApp(MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/register/': (context) => const RegistrationView(),
        '/login/': (context) => const LoginView(),
        '/verify_email/': (context) => const VerifyEmailView(),
        '/notes/': (context) => const NotesView(),
        '/home/': (context) => const LandingPage(),
        '/first/': (context) => const Firstpage(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Firstpage();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
//original creaters:
//Vidyt Bhudolia: https://github.com/VidytBhudolia
//Shreyas Mahajan: https://github.com/ShreyasMahajann