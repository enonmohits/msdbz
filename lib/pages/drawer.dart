import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  final String userName = 'Mohit singh'; // Replace with actual user data
  final String userEmail = 'abcd123@example.com';

  get padding => null; // Replace with actual user data

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: const CircleAvatar(
              child:
                  FlutterLogo(), // Replace with user profile picture if available
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Account Details'),
            onTap: () => print('Account Details'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print('Settings'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => print('Logout'),
          ),
        ],
      ),
    );
  }
}
