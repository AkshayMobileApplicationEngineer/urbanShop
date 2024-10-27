


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyNotesScreen extends StatelessWidget {
  const PrivacyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Notes'),
      ),
      body: const Center(
        child: Text('Read our privacy policy here.'),
      ),
    );
  }
}
