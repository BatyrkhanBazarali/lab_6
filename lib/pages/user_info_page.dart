import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserInfoPage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Phone: $phone', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
