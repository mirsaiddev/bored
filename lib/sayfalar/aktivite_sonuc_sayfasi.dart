import 'package:bored/models/activity_model.dart';
import 'package:bored/models/ana_sayfa_elemanlari/sonuc_sayfasi_bilgi.dart';
import 'package:bored/models/ana_sayfa_elemanlari/todays_activity.dart';
import 'package:bored/models/bilgi_nesnesi.dart';
import 'package:bored/models/constants.dart';
import 'package:bored/models/my_link_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SonucSayfasi extends StatefulWidget {
  final url;

  const SonucSayfasi({Key key, @required this.url}) : super(key: key);
  @override
  _SonucSayfasiState createState() => _SonucSayfasiState(url: url);
}

class _SonucSayfasiState extends State<SonucSayfasi> {
  final url;

  _SonucSayfasiState({@required this.url});

  Future<Activity> fetchActivity() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("body =" + jsonDecode(response.body).toString());
      return Activity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load acitivity');
    }
  }

  Future<Activity> activity;

  @override
  void initState() {
    super.initState();
    activity = fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> map1 = {
      'education': "Education",
      'recreational': "Recreational",
      'social': "Social",
      'diy': "DIY",
      'charity': "Charity",
      'cooking': "Cooking",
      'relaxation': "Relaxation",
      'music': "Music",
      'busywork': "Busywork",
    };
    return Scaffold(
      body: FutureBuilder(
        future: activity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hasData");
            if (snapshot.data.activity != null) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: anaSayfaUstPadding, right: anaSayfaYanPadding, left: anaSayfaYanPadding),
                    child: Column(
                      children: [
                        BugunkuAktivitenText(),
                        SonucSayfasiBilgiText(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: anaSyafaSonuclaraGitButonRengi,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              snapshot.data.activity,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Futura",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(),
                        ),
                        BilgiNesnesi(
                          anahtar: "Category",
                          deger: map1[snapshot.data.type],
                        ),
                        BilgiNesnesi(
                          anahtar: "Participants",
                          deger: snapshot.data.participants,
                        ),
                        BilgiNesnesi(
                          anahtar: "Accessibility",
                          deger: snapshot.data.accessibility,
                        ),
                        BilgiNesnesi(
                          anahtar: "Price",
                          deger: snapshot.data.price,
                        ),
                        snapshot.data.link == "" || snapshot.data.link == null
                            ? SizedBox()
                            : MyLinkText(
                                text: snapshot.data.link,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(color: anaSyafaSonuclaraGitButonRengi, borderRadius: BorderRadius.circular(14)),
                            child: Center(
                                child: Text(
                              "Find a new activity",
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
                            activity = fetchActivity();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: ScreenUtil().setHeight(200),
                    decoration: BoxDecoration(
                      color: anaSyafaSonuclaraGitButonRengi,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        "No activity found with the specified parameters",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Futura",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(color: anaSyafaSonuclaraGitButonRengi, borderRadius: BorderRadius.circular(14)),
                      child: Center(
                          child: Text(
                        "Back",
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
                      Navigator.pop(context);
                    },
                  ),
                ],
              ));
            }
          } else if (snapshot.hasError) {
            print("hasError");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
