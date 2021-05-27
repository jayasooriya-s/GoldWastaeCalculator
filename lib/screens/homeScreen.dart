import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_wastage_calculator/screens/resultsScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gold_wastage_calculator/widgets/CustomTextFormField.dart';
import 'package:gold_wastage_calculator/widgets/CustomButton.dart';

import 'package:gold_wastage_calculator/constants.dart';
import 'package:gold_wastage_calculator/widgets/CustomTitle.dart';

//active color
Color activeButtonColor = kLightBlueColor;
Color activeTextColor = kLightWhiteColor;
//inactive color
Color inactiveButtonColor = Colors.grey[200];
Color inactiveTextColor = kLightBlueColor;
//Wastage  Button
Color wastageButtonColor = activeButtonColor;
Color wastageTextColor = activeTextColor;

//ornament buttin
Color ornamentButtonColor = inactiveButtonColor;
Color ornamentTextColor = inactiveTextColor;
//Gram button
Color gramButtonColor = inactiveButtonColor;
Color gramTextColor = inactiveTextColor;
// % button
Color percentageButtonColor = activeButtonColor;
Color percentageTextColor = activeTextColor;

String inputField3 = 'Ornament Cost';
bool inputFieldEnable3 = true;
Color inputFieldColor;
String toFind = 'wastage';
String wastageIn = '%';
//

bool check = true;

//cost

double ornamentPrice;
double priceInGram;
double weightInGram;
double wastageInGram;

double taxInPercentage;
double calculatedWastage;
double calculatedOrnamentCost = 0.0;
double result = 0;

//For Calculation
double priceWithoutWastage;
double wastageInPercentage;
double totalWastagePrice;
double totalTaxCost;
double wastageInGrams;
double totalOrnamentCost;
double totalWastage;
//Map finalResult;

//Controller
TextEditingController pricePerGramController = TextEditingController();
TextEditingController ornamentPriceController = TextEditingController();
TextEditingController wastageConroller = TextEditingController();
TextEditingController ornamentWeightController = TextEditingController();
TextEditingController taxController = TextEditingController();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WastageCalculator();
  }
}

class WastageCalculator extends StatefulWidget {
  @override
  _WastageCalculatorState createState() => _WastageCalculatorState();
}

class _WastageCalculatorState extends State<WastageCalculator> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  height:
                      ScreenUtil().screenHeight - ScreenUtil().statusBarHeight,
                  width: ScreenUtil().screenWidth,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Center(
                            child: Text(
                              'Wastage \nCalculator',
                              style: GoogleFonts.monoton(
                                textStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  //fontWeight: FontWeight.w800,
                                  color: kDarkBlueColor,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        CustomTitle('Gold Rate Per Grams'),
                        TextFormFields(
                          controller: pricePerGramController,
                          // hintTexts: 'Enter the Gold Price Gram',
                          validate: (value) {
                            if (value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        CustomTitle('To Find '),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                right: 15.w,
                              ),
                              child: CustomButton(
                                buttonText: 'Wastage Cost',
                                width: 175.w,
                                buttonColor: wastageButtonColor,
                                textColor: wastageTextColor,
                                onPress: () {
                                  setState(() {
                                    wastageButtonColor = activeButtonColor;
                                    wastageTextColor = activeTextColor;
                                    ornamentButtonColor = inactiveButtonColor;
                                    ornamentTextColor = inactiveTextColor;
                                    inputField3 = "Ornament Cost";
                                    inputFieldEnable3 = true;
                                    inputFieldColor = null;
                                    toFind = 'wastage';

                                    check = true;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                right: 15.w,
                              ),
                              child: CustomButton(
                                buttonText: 'Ornament Cost',
                                width: 175.w,
                                buttonColor: ornamentButtonColor,
                                textColor: ornamentTextColor,
                                onPress: () {
                                  setState(() {
                                    wastageButtonColor = inactiveButtonColor;
                                    wastageTextColor = inactiveTextColor;
                                    ornamentButtonColor = activeButtonColor;
                                    ornamentTextColor = activeTextColor;
                                    inputField3 = "";
                                    inputFieldEnable3 = false;
                                    inputFieldColor = kLightWhiteColor;
                                    toFind = 'ornamentCost';

                                    check = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        check == true
                            ? Container(
                                child: Column(
                                  children: [
                                    CustomTitle(inputField3),
                                    TextFormFields(
                                      controller: ornamentPriceController,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      enable: inputFieldEnable3,
                                      fillColor: inputFieldColor,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: [
                                    CustomTitle('Watage'),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextFormFields(
                                            controller: wastageConroller,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            //titleText: 'Wastage',
                                            fieldWidth: 145.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(1.0.r),
                                            child: Text(
                                              'in',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(16),
                                                  color: Theme.of(context)
                                                      .hintColor),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          CustomButton(
                                            width: 90.w,
                                            buttonText: '%',
                                            buttonColor: percentageButtonColor,
                                            textColor: percentageTextColor,
                                            onPress: () {
                                              setState(() {
                                                gramButtonColor =
                                                    inactiveButtonColor;
                                                gramTextColor =
                                                    inactiveTextColor;
                                                percentageButtonColor =
                                                    activeButtonColor;
                                                percentageTextColor =
                                                    activeTextColor;
                                                wastageIn = "Percentage";
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 11.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 15.w),
                                            child: CustomButton(
                                              width: 90.w,
                                              buttonText: 'Grams',
                                              buttonColor: gramButtonColor,
                                              textColor: gramTextColor,
                                              onPress: () {
                                                setState(() {
                                                  gramButtonColor =
                                                      activeButtonColor;
                                                  gramTextColor =
                                                      activeTextColor;
                                                  percentageButtonColor =
                                                      inactiveButtonColor;
                                                  percentageTextColor =
                                                      inactiveTextColor;
                                                  wastageIn = 'Grams';
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        CustomTitle('Ornament Weight In Grams'),
                        TextFormFields(
                          controller: ornamentWeightController,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        CustomTitle(
                          'Tax',
                        ),
                        TextFormFields(
                          controller: taxController,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text('$result'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Container(
                      height: 55.h,
                      width: 380.w,
                      child: CustomButton(
                        buttonText: 'Calculate ',
                        buttonColor: kDarkBlueColor,
                        onPress: () {
                          _formKey.currentState.validate();
                          if (toFind == 'wastage') {
                            calculateWastage();
                            Map<String, double> finalResult = {
                              'resulttotalCostwithoutWastagenTax':
                                  priceWithoutWastage,
                              'resultWastage': totalWastagePrice,
                              'resultTax': totalTaxCost,
                              'resultTotalCost': totalOrnamentCost,
                            };
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultsScreen(
                                        finalResult: finalResult,
                                      )),
                            );
                          } else {
                            calculateOrnamentCost();
                            Map<String, double> finalResult = {
                              'resulttotalCostwithoutWastagenTax':
                                  priceWithoutWastage,
                              'resultWastage': totalWastagePrice,
                              'resultTax': totalTaxCost,
                              'resultTotalCost': totalOrnamentCost,
                            };
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultsScreen(
                                        finalResult: finalResult,
                                      )),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateOrnamentCost() {
    priceInGram = double.parse(pricePerGramController.text);

    taxInPercentage = double.parse(taxController.text) / 100;

    weightInGram = double.parse(ornamentWeightController.text);

    priceWithoutWastage = weightInGram * priceInGram;

    if (wastageIn == "Percentage") {
      wastageInPercentage = double.parse(wastageConroller.text) / 100;

      totalWastagePrice = priceWithoutWastage * wastageInPercentage;

      totalTaxCost =
          (priceWithoutWastage + totalWastagePrice) * taxInPercentage;

      calculatedOrnamentCost =
          (priceWithoutWastage + totalWastagePrice + totalTaxCost);
      totalOrnamentCost = calculatedOrnamentCost;
    } else {
      wastageInGrams = double.parse(wastageConroller.text);

      totalWastagePrice = wastageInGrams * priceInGram;
      totalTaxCost =
          (priceWithoutWastage + totalWastagePrice) * taxInPercentage;

      calculatedOrnamentCost =
          (priceWithoutWastage + totalWastagePrice + totalTaxCost);
      totalOrnamentCost = calculatedOrnamentCost;
    }
  }

  calculateWastage() {
    priceInGram = double.parse(pricePerGramController.text);

    taxInPercentage = double.parse(taxController.text) / 100;

    weightInGram = double.parse(ornamentWeightController.text);

    totalOrnamentCost = double.parse(ornamentPriceController.text);

    priceWithoutWastage = weightInGram * priceInGram;

    totalTaxCost = totalOrnamentCost * taxInPercentage;

    totalWastagePrice = totalOrnamentCost - priceWithoutWastage - totalTaxCost;
  }
}
