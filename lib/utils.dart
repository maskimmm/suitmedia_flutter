import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NewButton extends StatelessWidget {
  final GestureTapCallback route;
  final String textButton;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isClickable;

  const NewButton({
    super.key,
    required this.route,
    required this.textButton,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        color: isClickable == true ? HexColor('#2B637B') : Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isClickable == true
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: route,
                child: Center(
                  child: Text(
                    textButton,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: route,
              child: Center(
                child: Text(
                  textButton,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ),
    );
  }
}

class NewTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardInput;

  const NewTextField({
    super.key,
    required this.textEditingController,
    this.hintText = "",
    this.keyboardInput = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        keyboardType: keyboardInput,
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  final GestureTapCallback route;
  final String username;
  final String email;
  final String avatar;
  const NewCard(
      {Key? key,
      required this.username,
      required this.email,
      required this.avatar,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        InkWell(
          onTap: route,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      avatar,
                    ),
                    radius: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
