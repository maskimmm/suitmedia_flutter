import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/models/user.dart';
import 'package:suitmedia_flutter/screens/second_screen.dart';
import 'package:suitmedia_flutter/utils.dart';

class ThirdScreen extends StatefulWidget {
  ListUser listUser;
  String name;
  ThirdScreen({
    super.key,
    required this.listUser,
    required this.name,
  });

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: widget.listUser.data.isEmpty
          ? const Center(
              child: Text('No Data'),
            )
          : ListView.builder(
              itemCount: widget.listUser.data.length,
              itemBuilder: (_, index) => NewCard(
                    route: () {
                      Datum userData = Datum(
                          id: widget.listUser.data[index].id,
                          email: widget.listUser.data[index].email,
                          firstName: widget.listUser.data[index].firstName,
                          lastName: widget.listUser.data[index].lastName,
                          avatar: widget.listUser.data[index].avatar);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            selectedUser: userData,
                            name: widget.name,
                          ),
                        ),
                      );
                    },
                    username:
                        '${widget.listUser.data[index].firstName} ${widget.listUser.data[index].lastName}',
                    email: widget.listUser.data[index].email.toString(),
                    avatar: widget.listUser.data[index].avatar.toString(),
                  )),
    );
  }
}
