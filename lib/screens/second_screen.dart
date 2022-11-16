import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/models/user.dart';
import 'package:suitmedia_flutter/screens/third_screen.dart';
import 'package:suitmedia_flutter/utils.dart';

class SecondScreen extends StatefulWidget {
  final String? name;
  final Datum? selectedUser;
  const SecondScreen({super.key, this.name, this.selectedUser});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    print(widget.selectedUser);
    setState(() {});
  }

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
                  widget.name!,
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
              widget.selectedUser == null
                  ? 'No Selected User'
                  : '${widget.selectedUser!.firstName} ${widget.selectedUser!.lastName}',
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
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdScreen(
                            listUser: value,
                            name: widget.name!,
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
