import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

import 'models/constants.dart';
import 'sayfalar/ana_sayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(720, 1520),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(accentColor: anaSyafaSonuclaraGitButonRengi),
        debugShowCheckedModeBanner: false,
        home: AnaSayfa(),
      ),
    );
  }
}
