import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/models/user.dart';

class ThirdScreen extends StatefulWidget {
  late ListUser listUser;
  ThirdScreen({
    super.key,
    required this.listUser,
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
      body: ListView(
        children: [
          Text(
            widget.listUser.data.toString(),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              ),
              Column()
            ],
          )
        ],
      ),
    );
  }
}
