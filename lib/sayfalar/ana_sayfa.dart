import 'package:bored/models/ana_sayfa_elemanlari/ana_sayfa_ilk_parca/anasayfa_ilk_parca.dart';
import 'package:bored/models/constants.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnaSayfaIlkParca(),
              ],
            ),
          )),
    );
  }
}
