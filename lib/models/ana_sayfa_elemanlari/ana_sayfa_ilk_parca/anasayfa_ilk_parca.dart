import 'package:bored/sayfalar/aktivite_sonuc_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_select/smart_select.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../basliktexts.dart';
import '../../constants.dart';
import 'aktivitegetir.dart';
import 'arti_eksi_butonlari.dart';
import 'bilgilendirmeyazi.dart';
import 'kategori_text.dart';
import 'kisisayisitext.dart';

class AnaSayfaIlkParca extends StatefulWidget {
  const AnaSayfaIlkParca({
    Key key,
  }) : super(key: key);

  @override
  _AnaSayfaIlkParcaState createState() => _AnaSayfaIlkParcaState();
}

class _AnaSayfaIlkParcaState extends State<AnaSayfaIlkParca> {
  bool kategoriRandom = true;
  bool kisiSayisiRandom = true;
  bool accessibilityRandom = true;
  bool priceRandom = true;
  String accessibilityValue = "one";
  String priceValue = "one";

  String baseUrl = "https://www.boredapi.com/api/activity";

  int kisiSayisi = 1;

  int kisiSayisiSiniri = 5;

  int accessibilityIndex = 0;
  int priceIndex = 0;

  List<double> accessibilityValues = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
  List<double> priceValues = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

  SfRangeValues _values = const SfRangeValues(0.0, 1.0);
  SfRangeValues _priceValues = const SfRangeValues(0.0, 1.0);

  void linkiGetir() {
    kategoriGetir();
    kisiSayisiniGetir();
    accessibilityGetir();
    priceGetir();
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SonucSayfasi(url: baseUrl)));
  }

  void kategoriGetir() {
    String mybaseUrl = "https://www.boredapi.com/api/activity";
    String url = "$mybaseUrl?type=";
    if (kategoriRandom) {
      baseUrl = "https://www.boredapi.com/api/activity";
    } else {
      baseUrl = url + kategoriValue;
    }
    setState(() {});
    print("kategoriden sonra url = $baseUrl");
  }

  void kisiSayisiniGetir() {
    if (kisiSayisiRandom) {
      baseUrl = baseUrl;
    } else {
      setState(() {
        if (baseUrl.characters.length == 37) {
          baseUrl = "$baseUrl?participants=$kisiSayisi";
        } else {
          baseUrl = "$baseUrl&participants=$kisiSayisi";
        }
      });
    }
    print("kisi sayisindan sonra url = $baseUrl");
  }

  void accessibilityGetir() {
    if (!accessibilityRandom) {
      if (accessibilityValue == "one") {
        if (baseUrl.characters.length == 37) {
          baseUrl = "$baseUrl?accessibility=${accessibilityValues[accessibilityIndex]}";
        } else {
          baseUrl = "$baseUrl&accessibility=${accessibilityValues[accessibilityIndex]}";
        }
      } else {
        double min = _values.start;
        double max = _values.end;
        if (baseUrl.characters.length == 37) {
          baseUrl = "$baseUrl?minaccessibility=$min&maxaccessibility=$max";
        } else {
          baseUrl = "$baseUrl&minaccessibility=$min&maxaccessibility=$max";
        }
      }
      print("accesibilityden sonra url = $baseUrl");
    }
  }

  void priceGetir() {
    if (!priceRandom) {
      if (priceValue == "one") {
        if (baseUrl.characters.length == 37) {
          baseUrl = "$baseUrl?price=${priceValues[priceIndex]}";
        } else {
          baseUrl = "$baseUrl&price=${priceValues[priceIndex]}";
        }
      } else {
        double min = _priceValues.start;
        double max = _priceValues.end;
        if (baseUrl.characters.length == 37) {
          baseUrl = "$baseUrl?minprice=$min&maxprice=$max";
        } else {
          baseUrl = "$baseUrl&minprice=$min&maxprice=$max";
        }
      }
      print("price'tan sonra url = $baseUrl");
    }
  }

  String kategoriValue = 'education';
  List<S2Choice<String>> kategoriOptions = [
    S2Choice<String>(value: 'education', title: 'Education'),
    S2Choice<String>(value: 'recreational', title: 'Recreational'),
    S2Choice<String>(value: 'social', title: 'Social'),
    S2Choice<String>(value: 'diy', title: 'DIY'),
    S2Choice<String>(value: 'charity', title: 'Charity'),
    S2Choice<String>(value: 'cooking', title: 'Cooking'),
    S2Choice<String>(value: 'relaxation', title: 'Relaxation'),
    S2Choice<String>(value: 'music', title: 'Music'),
    S2Choice<String>(value: 'busywork', title: 'Busywork'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      margin: EdgeInsets.only(top: anaSayfaUstPadding, right: anaSayfaYanPadding, left: anaSayfaYanPadding),
      child: Column(
        children: [
          AktiviteGetir(),
          Bilgilendirme(),
          Divider(),
          KategoriText(),
          SwitchListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("Random"),
            ),
            activeColor: anaSyafaSonuclaraGitButonRengi,
            value: kategoriRandom,
            onChanged: (value) {
              setState(() {
                kategoriRandom = value;
              });
            },
          ),
          kategoriRandom
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: SmartSelect<String>.single(
                    title: 'Activity Category',
                    value: kategoriValue,
                    placeholder: "Select one",
                    choiceItems: kategoriOptions,
                    onChange: (state) {
                      kategoriValue = state.value;
                      if (state.value == "education" ||
                          state.value == "recreational" ||
                          state.value == "diy" ||
                          state.value == "charity" ||
                          state.value == "relaxation" ||
                          state.value == "music" ||
                          state.value == "busywork") {
                        kisiSayisi = 1;
                      }
                      setState(() {});
                    },
                  ),
                ),
          Divider(),
          KisiSayisiText(),
          SwitchListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("Random"),
            ),
            value: kisiSayisiRandom,
            activeColor: anaSyafaSonuclaraGitButonRengi,
            onChanged: (value) {
              setState(() {
                kisiSayisiRandom = value;
              });
            },
          ),
          kisiSayisiRandom
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  height: ScreenUtil().setHeight(90),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (kisiSayisi > 1) {
                              setState(() {
                                kisiSayisi--;
                              });
                            }
                          },
                          child: EksiButonu(),
                        ),
                      ),
                      SayacSayi(kisiSayisi: kisiSayisi),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (!kategoriRandom) {
                              if (kategoriValue == "education") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              } else if (kategoriValue == "recreational") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              } else if (kategoriValue == "social") {
                                kisiSayisiSiniri = 5;
                              } else if (kategoriValue == "diy") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              } else if (kategoriValue == "charity") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              } else if (kategoriValue == "cooking") {
                                kisiSayisiSiniri = 3;
                              } else if (kategoriValue == "relaxation") {
                                kisiSayisi = 1;
                                kisiSayisiSiniri = 1;
                              } else if (kategoriValue == "music") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              } else if (kategoriValue == "busywork") {
                                kisiSayisiSiniri = 1;
                                kisiSayisi = 1;
                              }
                            } else {
                              kisiSayisiSiniri = 5;
                            }
                            setState(() {});
                            if (kisiSayisi < kisiSayisiSiniri) {
                              setState(() {
                                kisiSayisi++;
                              });
                            } else {
                              kisiSayisiSiniriUyarisi();
                            }
                          },
                          child: ArtiButonu(),
                        ),
                      ),
                    ],
                  ),
                ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: BaslikText2(
                text: "Accessibility",
                color: anaSayfaIlkYaziColor,
              ),
            ),
          ),
          SwitchListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("Random"),
            ),
            value: accessibilityRandom,
            activeColor: anaSyafaSonuclaraGitButonRengi,
            onChanged: (value) {
              setState(() {
                accessibilityRandom = value;
              });
            },
          ),
          accessibilityRandom
              ? SizedBox()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: SmartSelect<String>.single(
                        modalType: S2ModalType.popupDialog,
                        title: 'Accessibility Type',
                        value: 'one',
                        choiceItems: [
                          S2Choice<String>(value: 'one', title: 'Single'),
                          S2Choice<String>(value: 'range', title: 'Range'),
                        ],
                        onChange: (state) => setState(() => accessibilityValue = state.value),
                      ),
                    ),
                    accessibilityValue == "one"
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            height: ScreenUtil().setHeight(90),
                            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (accessibilityIndex != 0) {
                                        setState(() {
                                          accessibilityIndex--;
                                        });
                                      }
                                    },
                                    child: EksiButonu(),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                  accessibilityValues[accessibilityIndex].toString(),
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Futura"),
                                )))),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (accessibilityIndex < 10) {
                                        setState(() {
                                          accessibilityIndex++;
                                        });
                                      }
                                    },
                                    child: ArtiButonu(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SfRangeSlider(
                            max: 1.0,
                            min: 0.0,
                            stepSize: 0.1,
                            values: _values,
                            showLabels: true,
                            showDivisors: true,
                            showTicks: true,
                            interval: 0.2,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                _values = values;
                              });
                            },
                          )
                  ],
                ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: BaslikText2(
                text: "Price",
                color: anaSayfaIlkYaziColor,
              ),
            ),
          ),
          SwitchListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("Random"),
            ),
            value: priceRandom,
            activeColor: anaSyafaSonuclaraGitButonRengi,
            onChanged: (value) {
              setState(() {
                priceRandom = value;
              });
            },
          ),
          priceRandom
              ? SizedBox()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: SmartSelect<String>.single(
                        modalType: S2ModalType.popupDialog,
                        title: 'Price Type',
                        value: 'one',
                        choiceItems: [
                          S2Choice<String>(value: 'one', title: 'Single'),
                          S2Choice<String>(value: 'range', title: 'Range'),
                        ],
                        onChange: (state) => setState(() => priceValue = state.value),
                      ),
                    ),
                    priceValue == "one"
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            height: ScreenUtil().setHeight(90),
                            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (priceIndex != 0) {
                                        setState(() {
                                          priceIndex--;
                                        });
                                      }
                                    },
                                    child: EksiButonu(),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                  priceValues[priceIndex].toString(),
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Futura"),
                                )))),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (priceIndex < 10) {
                                        setState(() {
                                          priceIndex++;
                                        });
                                      }
                                    },
                                    child: ArtiButonu(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SfRangeSlider(
                            max: 1.0,
                            min: 0.0,
                            stepSize: 0.1,
                            values: _priceValues,
                            showLabels: true,
                            showDivisors: true,
                            showTicks: true,
                            interval: 0.2,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                _priceValues = values;
                              });
                            },
                          )
                  ],
                ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(color: anaSyafaSonuclaraGitButonRengi, borderRadius: BorderRadius.circular(14)),
              child: Center(
                  child: Text(
                "Find activity",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Futura",
                  color: Colors.white,
                ),
              )),
              height: ScreenUtil().setHeight(90),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            onTap: () {
              linkiGetir();
            },
          ),
        ],
      ),
    );
  }

  void kisiSayisiSiniriUyarisi() {
    Fluttertoast.showToast(
      msg: "For this category max participans = $kisiSayisiSiniri",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[200],
      textColor: Colors.black87,
      fontSize: 16.0,
    );
  }
}

class SayacSayi extends StatelessWidget {
  const SayacSayi({
    Key key,
    @required this.kisiSayisi,
  }) : super(key: key);

  final int kisiSayisi;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            child: Center(
                child: Text(
      kisiSayisi.toString(),
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Futura"),
    ))));
  }
}
