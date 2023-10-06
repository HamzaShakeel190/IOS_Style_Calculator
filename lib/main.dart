import 'package:flutter/material.dart';

import 'components.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userInput = "";
  String currentOperator = "";
  String answer = "";

  void performOperation() {
    double? num1 = double.tryParse(answer);
    double? num2 = double.tryParse(userInput);
    if (num1 != null && num2 != null) {
      switch (currentOperator) {
        case "+":
          answer = (num1 + num2).toString();
          break;
        case "-":
          answer = (num1 - num2).toString();
          break;
        case "x": // Use '×' for multiplication
          answer = (num1 * num2).toString();
          break;
        case "÷":
          if (num2 != 0) {
            answer = (num1 / num2).toString();
          } else {
            answer = "Error: Division by zero";
          }
          break;
      }
      userInput = "";
    } else {
      // Handle invalid input, e.g., display an error message.
      answer = "Plz Enter the number";
    }
    setState(() {});
  }

  bool isValidInput(String input) {
    // Check for valid numeric input, disallowing multiple decimal points, etc.
    return double.tryParse(input) != null;
  }

  void handleInput(String input) {
    if (isValidInput(input)) {
      userInput += input;
      setState(() {});
    } else {
      // Handle invalid input, e.g., display an error message.
      answer = "Plz Enter the number";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextStyle(
                            txt: answer.toString(),
                          ),
                          CustomTextStyle(
                            txt: userInput.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Buttons(
                            onPress: () {
                              userInput = "";
                              answer = "";
                              setState(() {});
                            },
                            backgroundColor: operatorColorGrey,
                            txtColor: textColorBlack,
                            txt: "AC",
                          ),
                          Buttons(
                            onPress: () {
                              if (userInput.isNotEmpty && userInput[0] != '-') {
                                userInput = '-$userInput';
                              } else if (userInput.isNotEmpty &&
                                  userInput[0] == '-') {
                                userInput = userInput.substring(1);
                              }
                              setState(() {});
                            },
                            backgroundColor: operatorColorGrey,
                            txtColor: textColorBlack,
                            txt: "+/-",
                          ),
                          Buttons(
                            onPress: () {
                              double? num = double.tryParse(userInput);
                              if (num != null) {
                                num /= 100;
                                userInput = num.toString();
                                setState(() {});
                              }
                            },
                            backgroundColor: operatorColorGrey,
                            txtColor: textColorBlack,
                            txt: "%",
                            size: 30,
                          ),
                          Buttons(
                            onPress: () {
                              currentOperator = "÷";
                              answer = userInput;
                              userInput = "";
                              setState(() {});
                            },
                            backgroundColor: operatorColorOrange,
                            txtColor: textColorWhite,
                            txt: "÷",
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Buttons(
                            onPress: () {
                              userInput += "7";
                              setState(() {});
                            },
                            txt: "7",
                          ),
                          Buttons(
                              onPress: () {
                                userInput += "8";
                                setState(() {});
                              },
                              txt: "8"),
                          Buttons(
                              onPress: () {
                                userInput += "9";
                                setState(() {});
                              },
                              txt: "9"),
                          Buttons(
                            onPress: () {
                              currentOperator = "x";
                              answer = userInput;
                              userInput = "";
                              setState(() {});
                            },
                            backgroundColor: operatorColorOrange,
                            txtColor: textColorWhite,
                            txt: "x",
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Buttons(
                            onPress: () {
                              userInput += "4";
                              setState(() {});
                            },
                            txt: "4",
                          ),
                          Buttons(
                            onPress: () {
                              userInput += "5";
                              setState(() {});
                            },
                            txt: "5",
                          ),
                          Buttons(
                            onPress: () {
                              userInput += "6";
                              setState(() {});
                            },
                            txt: "6",
                          ),
                          Buttons(
                            onPress: () {
                              currentOperator = "-";
                              answer = userInput;
                              userInput = "";
                              setState(() {});
                            },
                            backgroundColor: operatorColorOrange,
                            txtColor: textColorWhite,
                            txt: "-",
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Buttons(
                            onPress: () {
                              userInput += "1";
                              setState(() {});
                            },
                            txt: "1",
                          ),
                          Buttons(
                            onPress: () {
                              userInput += "2";
                              setState(() {});
                            },
                            txt: "2",
                          ),
                          Buttons(
                            onPress: () {
                              userInput += "3";
                              setState(() {});
                            },
                            txt: "3",
                          ),
                          Buttons(
                            onPress: () {
                              currentOperator = "+";
                              answer = userInput;
                              userInput = "";
                              setState(() {});
                            },
                            backgroundColor: operatorColorOrange,
                            txtColor: textColorWhite,
                            txt: "+",
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Buttons(
                              onPress: () {
                                userInput += "0";
                                setState(() {});
                              },
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 25),
                              txt: "0",
                            ),
                          ),
                          Buttons(
                              onPress: () {
                                userInput += ".";
                                setState(() {});
                              },
                              txt: "."),
                          Buttons(
                            onPress: () {
                              performOperation();
                            },
                            backgroundColor: operatorColorOrange,
                            txtColor: textColorWhite,
                            txt: "=",
                            size: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
