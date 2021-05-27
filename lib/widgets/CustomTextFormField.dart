import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFields extends StatelessWidget {
  TextFormFields({
    this.hintTexts,
    this.prefixIcons,
    this.length = 10,
    this.validate,
    this.controller,
    this.titleText,
    this.fieldWidth = double.infinity,
    this.enable = true,
    this.fillColor,
    this.obscureText = false,
  });
  final String hintTexts;
  final IconData prefixIcons;
  final num length;
  final bool obscureText;
  final TextEditingController controller;
  final validate;
  final String titleText;
  final fieldWidth;
  final bool enable;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w, left: 15.w),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     titleText,
          //     style: TextStyle(
          //         fontSize: ScreenUtil().setSp(16),
          //         color: Theme.of(context).hintColor),
          //   ),
          // ),
          Container(
            width: fieldWidth,
            //height: 60.h,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0123456789.]'))
              ],

              enabled: enable,

              validator: validate,
              controller: controller,
              keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
              maxLength: length,
              obscureText: obscureText,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.r),
                fillColor: fillColor,
                prefixIcon: Icon(
                  prefixIcons,
                  size: 24.r,
                ),

                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF9FAFD),
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                hintText: hintTexts,
                hintStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  //letterSpacing: ScreenUtil().setSp(1.5),
                  color: Colors.black26,
                ),
                filled: true,
                hoverColor: Colors.blueAccent,
                focusColor: Colors.blueAccent,
                //fillColor: kLogoBackgroundColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).cardColor,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE7EAED),
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TextFormFieldSmall extends StatelessWidget {
//   TextFormFieldSmall(
//       {this.hintTexts,
//       this.prefixIcons,
//       this.length,
//       this.validate,
//       this.controller,
//       this.titleText,
//       this.fieldWidth,
//       this.obscureText = false});
//   final String hintTexts;
//   final IconData prefixIcons;
//   final num length;
//   final bool obscureText;
//   final TextEditingController controller;
//   final validate;
//   final String titleText;
//   final fieldWidth;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 15.w, left: 15.w),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: fieldWidth,
//             // height: 60.h,
//             child: TextFormField(
//               validator: validate,
//               controller: controller,
//               keyboardType: TextInputType.number,
//               // inputFormatters: [
//               //   FilteringTextInputFormatter.digitsOnly,
//               // ],
//               maxLength: length,
//               obscureText: obscureText,
//               cursorColor: Theme.of(context).primaryColor,
//               style: TextStyle(
//                 fontSize: ScreenUtil().setSp(36),
//                 color: Theme.of(context).accentColor,
//               ),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10.r),
//                 prefixIcon: Icon(
//                   prefixIcons,
//                   size: 24.r,
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xffE7EAED),
//                   ),
//                   borderRadius: BorderRadius.circular(15.r),
//                 ),
//                 hintText: hintTexts,
//                 hintStyle: TextStyle(
//                   fontSize: ScreenUtil().setSp(13),
//                   letterSpacing: ScreenUtil().setSp(1.5),
//                   color: Colors.black26,
//                 ),
//                 filled: true,
//                 hoverColor: Colors.blueAccent,
//                 focusColor: Colors.blueAccent,
//                 //fillColor: kLogoBackgroundColor,
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xffE7EAED),
//                   ),
//                   borderRadius: BorderRadius.circular(15.r),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xffE7EAED),
//                   ),
//                   borderRadius: BorderRadius.circular(15.r),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
