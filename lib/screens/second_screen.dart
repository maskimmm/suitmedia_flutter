import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/models/user.dart';
import 'package:suitmedia_flutter/screens/third_screen.dart';
import 'package:suitmedia_flutter/utils.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final String? selectedUser;
  const SecondScreen({super.key, required this.name, this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.1),
            child: Text(
              selectedUser ?? 'No Selected User',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 0.95),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: NewButton(
                  route: () async {
                    ListUser.fetchUser(1).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdScreen(
                            listUser: value,
                          ),
                        ),
                      ),
                    );
                  },
                  textButton: 'Choose a user'),
            ),
          )
        ],
      ),
    );
  }
}
