import 'package:flutter/material.dart';
import 'package:petscan/pages/articles.dart';
import 'package:petscan/pages/paw.dart';
import 'package:petscan/pages/accounts.dart';

//pages
import 'package:petscan/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this at the top

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  __Buildimage(),
                  const SizedBox(height: 16),
                  _buildActionButtons(),
                  const SizedBox(height: 16),
                  const SizedBox(height: 8),
                  _buildArticleFilters(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildArticleGrid(),
            ),
          ],
        ),
      ),
    );
  }

// Update image height
  Widget __Buildimage() {
    return Container(
      width: double.infinity,
      height: 100, // Reduced from 120
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/featured_pet.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton('Diseases', Icons.healing),
          _buildActionButton('Scan', Icons.search),
          _buildActionButton('Remedy', Icons.medical_services),
        ],
      ),
    );
  }

// Update action button sizes
  Widget _buildActionButton(String label, IconData icon) {
    return InkWell(
      // Changed from GestureDetector to InkWell for better feedback
      onTap: () {
        if (label == 'Scan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Paw()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ArticlesPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, size: 28, color: Col.primary),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleFilters() {
    return Row(
      children: [
        _buildFilterChip('All', true),
        const SizedBox(width: 8),
        _buildFilterChip('Dogs', false),
        const SizedBox(width: 8),
        _buildFilterChip('Cats', false),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Col.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Col.primary : Colors.grey,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

// Update article grid
  Widget _buildArticleGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            if (index == 0) {
              // Only first article opens the URL
              final Uri url = Uri.parse(
                  'https://www.vet.cornell.edu/departments-centers-and-institutes/riney-canine-health-center/canine-health-information/atopic-dermatitis-atopy');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/onboarding1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/logo2.png',
              height: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Col.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
