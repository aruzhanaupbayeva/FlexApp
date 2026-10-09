
import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          CircleAvatar(
            radius: 35,
            backgroundColor: purple,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'FlexApp Member',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Membership: Flex Premium'),
          Divider(height: 35),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text('My Workouts'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payments'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}