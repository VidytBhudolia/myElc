import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => MyApp();
}

class MyApp extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage("assets/background_image.png"),
            image: AssetImage("assets/background_image_watermark.png"),

            // image: AssetImage("assets/bg_black.png"),

            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Wrap the Column with Center widget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Center align the children vertically
            children: <Widget>[
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                  debugPrint('Login button pressed');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[500]!),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                    (states) => const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
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
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/register/', (route) => false);
                  debugPrint('Sign Up button pressed');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[500]!),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                    (states) => const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
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
                  'Sign Up',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 30),
              const Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Shreyas Mahajan (102317085)',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Shreyas Mahajan (102317085)',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Shreyas Mahajan (102317085)',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Shreyas Mahajan (102317085)',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
