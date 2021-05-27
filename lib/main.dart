import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/homeScreen.dart';
import 'screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 843),
      builder: () => MaterialApp(
        theme: Theme.of(context).copyWith(
            backgroundColor: Color(0xffF9FAFD),
            primaryColor: Color(0xffA17CCE)),
        //darkTheme: ThemeData.dark(),
        home: SplashScreen(),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: widget,
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
