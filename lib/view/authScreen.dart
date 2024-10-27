import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'PrivacyNotesScreen.dart';
import 'forgetScreen.dart';
import 'mainScreen.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';

  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool keepSignedIn = false;
  final _formKey = GlobalKey<FormState>();

  final String dummyEmail = "user@example.com";
  final String dummyPassword = "password123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0E7C6),
        title: const Text(
          "UrbanBasket",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sign in with Email and Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A4A4A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildTextField(
                  controller: emailController,
                  label: 'Email',
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: passwordController,
                  label: 'Password',
                  isPassword: true,
                  obscureText: !showPassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCheckboxTile(
                      "Show Password",
                      showPassword,
                          (value) => setState(() => showPassword = value!),
                    ),
                    _buildCheckboxTile(
                      "Keep Signed In",
                      keepSignedIn,
                          (value) => setState(() => keepSignedIn = value!),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _buildSignInButton(),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const Divider(thickness: 1),
                const Center(
                  child: Text(
                    "New to UrbanBasket Shopping App?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 15),
                _buildCreateAccountButton(),
                const SizedBox(height: 10),
                _buildPrivacyButton(),
                const Spacer(),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool isPassword,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isPassword && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (!isPassword && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildCheckboxTile(String title, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFE0A163),
        ),
        Text(title),
      ],
    );
  }

  Widget _buildSignInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE0A163),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (emailController.text == dummyEmail &&
              passwordController.text == dummyPassword) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid email or password')),
            );
          }
        }
      },
      child: const Text(
        "Sign In",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE0A163),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        print("Create an UrbanBasket Account");
      },
      child: const Text(
        "Create an UrbanBasket Account",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildPrivacyButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PrivacyNotesScreen(),
          ),
        );
      },
      child: const Text(
        "Conditions of the Privacy Notes",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: const Color(0xFFE6E4D9),
      child: Center(
        child: Text(
          "Created by @MeliveAkshay  Version v1.0.0",
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ),
    );
  }
}
