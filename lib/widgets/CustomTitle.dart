import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  final String titleText;
  CustomTitle(this.titleText);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0.w, top: 8.h, bottom: 8.h),
        child: Text(
          titleText,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
