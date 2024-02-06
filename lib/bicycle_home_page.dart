import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cycle/bicycle_user_profile.dart';
import 'package:cycle/login.dart';
import 'package:get/get.dart'; // Import Get

class BicycleRentalHomePage extends StatefulWidget {
  const BicycleRentalHomePage({Key? key}) : super(key: key);

  @override
  _BicycleRentalHomePageState createState() => _BicycleRentalHomePageState();
}

class _BicycleRentalHomePageState extends State<BicycleRentalHomePage> {
  int bottomIndex = 0;

  void handleLogout() async {
    // Sign out the user using Firebase Authentication
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()), // Use MyLogin here
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void navigateToUserProfile() {
    Get.to(() => const UpdateProfileScreen()); // Make sure this import is correct
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text("Hello, ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    const Text("Rider", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    const Spacer(),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: handleLogout,
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: GNav(
            selectedIndex: bottomIndex,
            onTabChange: (idx) {
              setState(() {
                bottomIndex = idx;
                if (idx == 3) {
                  // If the "Profile" tab is pressed, navigate to the user profile screen
                  navigateToUserProfile();
                }
              });
            },
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 250),
            gap: 2,
            activeColor: Colors.black,
            iconSize: 24,
            tabBackgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: const [
              GButton(
                icon: LineAwesomeIcons.home, // Updated icon
                text: 'Home',
              ),
              GButton(
                icon: LineAwesomeIcons.bicycle, // Updated icon
                text: 'Bikes',
              ),
              GButton(
                icon: LineAwesomeIcons.search, // Updated icon
                text: 'Search',
              ),
              GButton(
                icon: LineAwesomeIcons.user, // Updated icon
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


