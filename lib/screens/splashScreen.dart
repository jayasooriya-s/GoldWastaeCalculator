import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          (Route<dynamic> route) => false);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gold \nWastage \nCalculator',
              style: GoogleFonts.monoton(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  //fontWeight: FontWeight.w800,
                  color: kLightWhiteColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100.h,
            ),
            SpinKitFadingCircle(
              color: kLightBlueColor,
              size: 50,
              duration: Duration(seconds: 2),
            )
          ],
        ),
      ),
    );
  }
}
