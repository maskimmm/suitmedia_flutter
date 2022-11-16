import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/screens/second_screen.dart';
import 'package:suitmedia_flutter/utils.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewTextField(
                  textEditingController: nameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 10),
                NewTextField(
                  textEditingController: palindromeController,
                  hintText: 'Palindrome',
                ),
                const SizedBox(height: 70),
                NewButton(
                  route: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return isPalindrome(palindromeController.text);
                        });
                  },
                  textButton: 'CHECK',
                ),
                const SizedBox(height: 10),
                NewButton(
                  route: () {
                    if (nameController.text == '') {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Must insert name'),
                            );
                          });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            name: nameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  textButton: 'NEXT',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

isPalindrome(String text) {
  String newText = text.replaceAll(' ', '');
  for (var i = 0; i < newText.length; i++) {
    if (newText[i] == newText[newText.length - 1 - i]) {
      continue;
    } else {
      return const AlertDialog(
        content: Text('Not Palindrome'),
      );
    }
  }
  return const AlertDialog(
    content: Text('Palindrome'),
  );
}
