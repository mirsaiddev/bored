import 'package:flutter/material.dart';

class BilgiNesnesi extends StatelessWidget {
  final String anahtar;
  final deger;
  const BilgiNesnesi({Key key, @required this.anahtar, @required this.deger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$anahtar : ",
            style: TextStyle(fontSize: 16, fontFamily: "Futura", color: Colors.black45),
          ),
          Text(
            "$deger",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Futura",
            ),
          )
        ],
      ),
    );
  }
}