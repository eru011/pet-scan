import 'package:flutter/material.dart';
import 'package:petscan/constants/colors.dart';
import 'package:petscan/main.dart';

typedef SignupCallback = void Function(String email, String password);

class SignupPage extends StatefulWidget {
  final SignupCallback onSignup;
  const SignupPage({super.key, required this.onSignup});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Hi!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Welcome\nto\nPetScan',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'ArchivoNarrow',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.email, color: Col.primary),
                  label: const Text('CONTINUE WITH EMAIL',
                      style: TextStyle(
                        color: Col.primary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      )),
                  onPressed: () {
                    widget.onSignup(
                        _emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/google_icon.png',
                    height: 24,
                  ),
                  label: const Text('CONTINUE WITH GOOGLE',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 11)),
                  onPressed: () {
                    // Google sign in logic will be added later
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Col.primary,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white60),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.person_outline,
                    color: Col.primary,
                  ),
                  label: const Text('CONTINUE WITH GUEST USER',
                      style: TextStyle(
                          color: Col.primary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 11)),
                  onPressed: () {
                    // Guest user logic will be added later
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: const [
                    Text(
                      "ALREADY HAVE AN ACCOUNT?",
                      style: TextStyle(
                          color: Colors.white70, fontFamily: 'Archivo'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
