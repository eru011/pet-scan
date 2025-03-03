import 'package:flutter/material.dart';
import 'package:petscan/constants/colors.dart';
import 'package:petscan/pages/onboarding.dart';

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 200,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/catdog.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54, // Darker overlay for better text readability
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Welcome to\nWellFur',
                  style: TextStyle(
                      fontSize: 40,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Your easy-to-use skin check companion.\n'
                  'Quickly scan and get helpful advice to\n'
                  "keep your pet's skin healthy.\n" // Use double quotes here
                  'Start scanning now for a happier,\n'
                  'itch-free pet!',
                  style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontFamily: 'Archivo'),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Col.primary,
                      minimumSize: const Size(200, 56),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontFamily: 'Archivo',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
