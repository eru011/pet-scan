import 'package:flutter/material.dart';
import 'package:petscan/constants/colors.dart';
import 'package:petscan/services/signup.dart';
import 'package:petscan/main.dart';

typedef LoginCallback = void Function(String email, String password);

class LoginPage extends StatefulWidget {
  final LoginCallback onLogin;
  const LoginPage({super.key, required this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Welcome Back\nto\nPetScan',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'ArchivoNarrow',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.email, color: Col.primary),
                  label: const Text('CONTINUE WITH EMAIL',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Col.primary)),
                  onPressed: () {
                    widget.onLogin(
                        _emailController.text, _passwordController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(
                        onSignup: (email, password) {},
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      "DON'T HAVE AN ACCOUNT?",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    Text("SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ))
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
