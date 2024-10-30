import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = false;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password, _confirmPassword;

  void toggleView() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  void showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) => _privacyPolicyDialog(),
    );
  }

  Widget _signInOrSignUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              if (value != 'dummy@example.com') {
                return 'Invalid credentials';
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              if (value != 'dummy') {
                return 'Invalid credentials';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          SizedBox(height: 16),
          if (isSignUp)
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Confirm Password is required';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onSaved: (value) => _confirmPassword = value!,
            ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSignUp ? Colors.blue : Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Implement your sign in or sign up logic here
                print('Email: $_email, Password: $_password');
              }
            },
            child: Text(
              isSignUp ? 'Sign Up' : 'Sign In',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
              );
            },
            child: Text('Forgot Password?', style: TextStyle(fontSize: 16)),
          ),
          TextButton(
            onPressed: toggleView,
            child: Text(
              isSignUp ? 'Already have an account? Sign In' : 'Don’t have an account? Sign Up',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dummyCredentials() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Demo Credentials',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Email: dummy@example.com',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          'Password: dummy',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _privacyPolicyDialog() {
    return AlertDialog(
      title: const Text('Privacy Policy'),
      scrollable: true,
      content: const Text('Your privacy policy content goes here.'),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSignUp ? 'Sign Up' : 'Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                _signInOrSignUpForm(),
                SizedBox(height: 20),
                _dummyCredentials(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
