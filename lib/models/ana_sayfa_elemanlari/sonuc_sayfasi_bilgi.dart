import 'package:flutter/material.dart';

import '../constants.dart';

class SonucSayfasiBilgiText extends StatelessWidget {
  const SonucSayfasiBilgiText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "You can do today :",
          style: TextStyle(
            fontFamily: "Futura",
            color: anaSayfaIlkYaziColor,
          ),
        ),
      ),
    );
  }
}
