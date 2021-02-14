import 'package:flutter/material.dart';

import '../../basliktexts.dart';
import '../../constants.dart';

class KisiSayisiText extends StatelessWidget {
  const KisiSayisiText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: BaslikText2(
          text: "Participants",
          color: anaSayfaIlkYaziColor,
        ),
      ),
    );
  }
}
