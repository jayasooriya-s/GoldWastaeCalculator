import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_wastage_calculator/widgets/CustomButton.dart';

Map<String, double> dataMap;

String totalCost;
String totalWastage;
String totalTax;
String totalGoldCost;

class ResultsScreen extends StatefulWidget {
  ResultsScreen({this.finalResult});
  final Map finalResult;

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  TextStyle customTextStyle =
      TextStyle(fontSize: ScreenUtil().setSp(22), color: Color(0xff312E52));

  @override
  void initState() {
    super.initState();
    print(widget.finalResult);
    totalCost = (widget.finalResult['resultTotalCost']).toString();
    totalGoldCost =
        (widget.finalResult['resulttotalCostwithoutWastagenTax']).toString();
    totalTax = (widget.finalResult['resultTax']).toString();
    totalWastage = (widget.finalResult['resultWastage']).toString();
    //totalCost = (widget.finalResult.remove('resultTotalCost')).toString();

    widget.finalResult.remove('resultTotalCost');
    print(widget.finalResult);
  }

  // Map<String, double> dataap = widget.finalResult;

  // Map<String, double> dataMap = {
  //   "Flutter": 5,
  //   "React": 3,
  //   "Xamarin": 2,
  //   //"Ionic": 2,
  // };
  List<Color> colorList = [
    Color(0xffA17CCE),
    Color(0xff72D8BF),
    Color(0xffFD7D7F),
    //Color(0xffFFB571)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff312E52),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    'Result',
                    style: GoogleFonts.monoton(
                      textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(45),
                          //fontWeight: FontWeight.w800,
                          color: Color(0xffF9FAFD)),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                PieChart(
                  dataMap: widget.finalResult,
                  animationDuration: Duration(milliseconds: 800),
                  chartRadius: 250.r,
                  colorList: colorList,
                  chartType: ChartType.ring,
                  chartValuesOptions: ChartValuesOptions(
                    chartValueStyle: TextStyle(color: Color(0xffF9FAFD)),
                    showChartValuesOutside: true,
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    decimalPlaces: 0,
                  ),
                  ringStrokeWidth: 10.r,
                  //centerText: 'jdfcijsdii',
                  legendOptions: LegendOptions(
                      showLegends: false,
                      legendTextStyle:
                          TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 330.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF9FAFD),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListItems(
                          price: totalGoldCost,
                          itemName: 'Gold Price',
                          itemColor: Color(0xffA17CCE),
                        ),
                        ListItems(
                          price: totalWastage,
                          itemName: 'Wastage Cost',
                          itemColor: Color(0xff72D8BF),
                        ),
                        ListItems(
                          price: totalTax,
                          itemName: 'GST ',
                          itemColor: Color(0xffFD7D7F),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Divider(
                            color: Color(0xffA17CCE),
                            thickness: 1,
                          ),
                        ),
                        ListItems(
                          itemColor: Color(0xffF9FAFD),
                          itemName: 'Total Cost',
                          price: totalCost,
                          listTextStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              fontWeight: FontWeight.bold,
                              color: Color(0xff312E52)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0.r),
                          child: CustomButton(
                            buttonColor: Color(0xff312E52),
                            width: double.infinity,
                            buttonText: 'Recalculate',
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                left: 10.w,
                right: 10.w,
                top: 290.h,
                child: Container(
                  height: 40,
                  width: 300,
                  child: Center(
                    child: Text(
                      '₹ $totalCost',
                      style: TextStyle(color: Color(0xffF9FAFD), fontSize: 30),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

TextStyle customTextStyle =
    TextStyle(fontSize: ScreenUtil().setSp(22), color: Color(0xff312E52));

class ListItems extends StatelessWidget {
  final Color itemColor;
  final String itemName;
  final String price;
  final TextStyle listTextStyle;
  ListItems({this.itemColor, this.itemName, this.price, this.listTextStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 20.r,
              width: 20.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: itemColor,
              )),
          // CircleAvatar(
          //   backgroundColor: itemColor,
          //   radius: 10.r,
          // ),
          // SizedBox(
          //   width: 10.w,
          // ),
          Container(
            child: Text(
              itemName,
              style: listTextStyle == null ? customTextStyle : listTextStyle,
            ),
            width: 120.w,
          ),
          Text(
            '₹ ',
            style: listTextStyle == null ? customTextStyle : listTextStyle,
          ),
          Container(
            child: Text(
              price,
              style: listTextStyle == null ? customTextStyle : listTextStyle,
              maxLines: 1,
            ),
            width: 100.w,
          )
        ],
      ),
    );
  }
}
