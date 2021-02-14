import 'package:flutter/material.dart';

import '../basliktexts.dart';
import '../constants.dart';

class BugunkuAktivitenText extends StatelessWidget {
  const BugunkuAktivitenText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: BaslikText1(
          text: "Today's Activity",
          color: anaSayfaIlkYaziColor,
        ),
      ),
    );
  }
}