import 'package:flutter/material.dart';
import 'signin.dart'; // Importing the sign-in page
import 'homepage.dart'; // Importing the home page

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003F63), // Setting background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Title Text
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Username Field
              TextFormField(
                style: const TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.black), // Icon color
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.black), // Label color
                  filled: true,
                  fillColor: Colors.white, // Solid white fill color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black), // Border color
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                style: const TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.black), // Icon color
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.black), // Label color
                  filled: true,
                  fillColor: Colors.white, // Solid white fill color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black), // Border color
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.black), // Icon color
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black), // Label color
                  filled: true,
                  fillColor: Colors.white, // Solid white fill color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black), // Border color
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Handle sign-up action and navigate to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Already have an account? Sign In
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                child: const Text(
                  'Already have an account? Sign In',
                  style: TextStyle(color: Colors.white, ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
