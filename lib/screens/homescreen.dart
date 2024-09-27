import 'package:flutter/material.dart';
import 'package:naukri_machine_test/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${userProvider.username}'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userProvider.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Value: ${userProvider.value}',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: userProvider.incrementValue,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
