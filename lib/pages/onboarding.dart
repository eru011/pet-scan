import 'package:flutter/material.dart';
import 'package:petscan/constants/colors.dart';
import 'package:petscan/main.dart';
import 'package:petscan/pages/home.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(
                  'assets/onboarding1.png',
                  'Scan with Confidence',
                  'Quick and easy pet skin scanning\nfor early detection of issues',
                ),
                _buildPage(
                  'assets/onboarding2.png',
                  'Track Progress',
                  'Monitor your pet\'s skin health\nover time with detailed records',
                ),
                _buildPage(
                  'assets/onboarding3.png',
                  'Get Started',
                  'Begin your journey to better\npet skin health today',
                ),
              ],
            ),
            // Navigation arrows
            Positioned(
              left: 16,
              bottom: 32,
              child: _currentPage > 0
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Col.primary, width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back, // Changed to new icon
                          size: 20, // Smaller size
                        ),
                        padding: const EdgeInsets.all(8), // Adjusted padding
                        constraints:
                            const BoxConstraints(), // Remove default constraints
                        color: Col.primary,
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              right: 16,
              bottom: 32,
              child: _currentPage < 2
                  ? Container(
                      decoration: BoxDecoration(
                        color: Col.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
            // Page indicators
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => _buildDot(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String description) {
    return Column(
      children: [
        // Upper half - Image
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        // Lower half - Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Col.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (_currentPage == 2) ...[
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to main app
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Col.primary,
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Col.primary : Colors.grey.shade300,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
