import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_views.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';

void main() {
  runApp(MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/register/': (context) => RegistrationView(),
        '/login/': (context) => LoginView(),
        '/verify_email/': (context) => VerifyEmailView(),
        '/notes/': (context) => NotesView(),
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
        // switch (snapshot.connectionState) {
        //   case ConnectionState.done:
        //     final user = FirebaseAuth.instance.currentUser;
        //     if (user != null) {
        //       if (user.emailVerified)
        //         print("Email Verified");
        //       else
        //         return VerifyEmailView();
        //     } else
        //       return LoginView();
        //     return const Text("Done");

        //   default:
        //     return CircularProgressIndicator();
        // }
        if (snapshot.connectionState == ConnectionState.done) {
          //   final user = FirebaseAuth.instance.currentUser;
          //   if(user != null)
          //   {
          //     if(user.emailVerified)
          //     {
          //       return NotesView();
          //     }
          //     else
          //     {
          //       return VerifyEmailView();
          //     }
          //   }
          //   else
          //   {
          //     return LoginView();
          //   }
          // }
          return LoginView();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main UI"),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final showLogOut = await showLogOutDialog(context);
                  if (showLogOut) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login/', (_) => false);
                  }
                  // if(value)
                  // {
                  //   FirebaseAuth.instance.signOut();
                  // }

                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to the main UI"),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
