import 'package:flutter/material.dart';

import '../../basliktexts.dart';
import '../../constants.dart';

class KategoriText extends StatelessWidget {
  const KategoriText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: BaslikText2(
          text: "Category",
          color: anaSayfaIlkYaziColor,
        ),
      ),
    );
  }
}
