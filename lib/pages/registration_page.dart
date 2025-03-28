import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Validation for full name
  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name cannot be empty';
    } else if (value.length < 2) {
      return 'Full Name must be at least 2 characters long';
    }
    return null;
  }

  // Validation for email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!value.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  // Validation for phone number
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number cannot be empty';
    } else if (!value.startsWith('+')) {
      return 'Phone Number must start with +';
    }
    return null;
  }

  // Validation for password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'[AEIOUYaeiouy]').hasMatch(value)) {
      return 'Password must include at least one vowel';
    }
    return null;
  }

  // Validation for confirm password
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Show profile information dialog
  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            'Profile Information',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name: ${_fullNameController.text}'),
              Text('Phone Number: ${_phoneController.text}'),
              Text('Email: ${_emailController.text}'),
              Text('Password: ${_passwordController.text}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Show success message
  void _showSuccessMessage() {
    final snackBar = SnackBar(
      content: const Text(
        'Successfully registered!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        title: const Text('Register Form'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF90CAF9), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E88E5),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Full Name Field
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name *',
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _fullNameController.clear();
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: _validateFullName,
                    ),
                    const SizedBox(height: 16.0),
                    // Phone Number Field
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number *',
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _phoneController.clear();
                          },
                        ),
                        hintText: 'Phone format: +XXX...',
                        border: const OutlineInputBorder(),
                      ),
                      validator: _validatePhoneNumber,
                    ),
                    const SizedBox(height: 16.0),
                    // Email Address Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address *',
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _emailController.clear();
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16.0),
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password *',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 16.0),
                    // Confirm Password Field
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password *',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showSuccessMessage();
                            _showProfileDialog();
                          }
                        },
                        child: const Text(
                          'Submit Form',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
