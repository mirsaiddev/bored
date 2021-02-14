import 'package:flutter/material.dart';

class BaslikText1 extends StatelessWidget {
  final String text;
  final Color color;
  const BaslikText1({
    Key key,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        fontFamily: "Futura",
        color: color,
      ),
    );
  }
}

class BaslikText2 extends StatelessWidget {
  final String text;
  final Color color;
  const BaslikText2({
    Key key,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        color: color,
      ),
    );
  }
}
