import 'package:flutter/material.dart';

import '../../constants.dart';

class Bilgilendirme extends StatelessWidget {
  const Bilgilendirme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Set the variables below as you want and find activities just for you! Let's find you something to do!",
          style: TextStyle(
            fontFamily: "Futura",
            color: anaSayfaIlkYaziColor,
          ),
        ),
      ),
    );
  }
}
