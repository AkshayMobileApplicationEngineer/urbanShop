import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'authScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UrbanBasket"),
        backgroundColor: const Color(0xFFF0E7C6),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          _buildLoginButton(context),
          const Spacer(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE0A163),
            elevation: 4,
            shadowColor: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AuthScreen.routeName);
          },
          child: const Text(
            "Login Activity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFFE6E4D9),
      child: Column(
        children: [
          const Divider(thickness: 1, color: Colors.black12, indent: 20, endIndent: 20),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (kDebugMode) {
                print("TextButton pressed");
              }
            },
            child: const Text(
              "Created by @MeliveAkshay\nVersion v1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
