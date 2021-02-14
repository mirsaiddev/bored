import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

class MyLinkText extends StatelessWidget {
  final String text;
  const MyLinkText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Link : ",
            style: TextStyle(fontSize: 16, fontFamily: "Futura", color: Colors.black45),
          ),
          LinkText(
            text: text,
            textStyle: TextStyle(
              fontSize: 16,
              fontFamily: "Futura",
            ),
          ),
        ],
      ),
    );
  }
}
