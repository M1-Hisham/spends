import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 3.5,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 120,
                width: 120,
                child: const Icon(
                  Icons.person,
                  size: 90,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text(
                'Username',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              trailing: Icon(
                Icons.check_box,
                size: 30,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
