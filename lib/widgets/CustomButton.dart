import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final double width;
  final Color buttonColor;
  final Color textColor;
  CustomButton(
      {this.buttonText,
      this.onPress,
      this.width = double.infinity,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RawMaterialButton(
      elevation: 0,
      constraints: BoxConstraints(
        minHeight: 55.h,
        minWidth: width,
      ),
      onPressed: onPress,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: textColor == null ? Color(0xffF9FAFD) : textColor,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      fillColor: buttonColor == null ? Color(0xffA17CCE) : buttonColor,
    ));
  }
}
