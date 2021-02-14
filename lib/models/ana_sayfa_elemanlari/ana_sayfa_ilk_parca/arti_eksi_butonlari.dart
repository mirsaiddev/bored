import 'package:flutter/material.dart';

import '../../constants.dart';

class ArtiButonu extends StatelessWidget {
  const ArtiButonu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "+",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Futura"),
        ),
      ),
      decoration: BoxDecoration(
        color: kisiSayisiSayacArtirRengi,
        borderRadius: BorderRadius.only(topRight: Radius.circular(14), bottomRight: Radius.circular(14)),
      ),
    );
  }
}

class EksiButonu extends StatelessWidget {
  const EksiButonu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "-",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "TTInterfaces"),
        ),
      ),
      decoration: BoxDecoration(
        color: kisiSayisiSayacAzaltRengi,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
      ),
    );
  }
}
