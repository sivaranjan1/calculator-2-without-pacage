import 'package:calculator_2/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: calculator());
  }
}

class calculator extends StatefulWidget {
  calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String userinput = '';
  String output = '';
  String sign = '';
  int first = 0;
  int second = 0;
  int value = 0;

  List<String> names = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'CLR',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 91, 105, 10),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(173, 201, 174, 5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 20),
                ]),
            margin: EdgeInsets.all(25),
            width: 350,
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: names.length,
                itemBuilder: ((context, index) {
                  return Buttons(
                    pressed: () => buttonpressed(names[index]),
                    buttonColor: ischeck(names[index])
                        ? Colors.red.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.2),
                    textColor: Colors.white,
                    buttonText: names[index],
                  );
                }),
              ))
        ],
      ),
    );
  }

  bool ischeck(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  String res = '', text = '';

  void buttonpressed(String a) {
    if (a == 'C') {
      res = '';
      text = '';
      first = 0;
      second = 0;
    } else if (a == 'DEL') {
      res = res.substring(0, res.length - 1);
    } else if (a == '%' || a == '/' || a == 'X' || a == '-' || a == '+') {
      first = int.parse(text);
      res = '';
      sign = a;
    } else if (a == '=') {
      second = int.parse(text);
      if (sign == '+') {
        res = (first + second).toString();
      }
      if (sign == '-') {
        res = (first - second).toString();
      }
      if (sign == '/') {
        res = (first / second).toString();
      }
      if (sign == 'X') {
        res = (first * second).toString();
      }
      if (sign == '%') {
        res = (first % second).toString();
      }
    } else {
      res = text + a;
    }

    setState(() {
      text = res;
    });
  }
}





















    // if (a == 'C') {
    //   text = '';
    // } else if (a == 'DEL') {
    //   text = userinput.substring(0, userinput.length - 1);
    // } else if (a == '%' || a == '/' || a == 'X' || a == '-' || a == '+') {
    //   first = int.parse(text);
    //   text = '';
    //   sign = a;
    // } else if (a == '=') {
    //   second = int.parse(text);
    // }
    // if (sign == '+') {
    //   text = (first + second).toString();
    // }
    // if (sign == '-') {
    //   text = (first - second).toString();
    // }
    // if (sign == '/') {
    //   text = (first ~/ second).toString();
    // }
    // if (sign == '*') {
    //   text = (first * second).toString();
    // }
    // if (sign == '%') {
    //   text = (first % second).toString();
    // } else {
    //   text = int.parse(userinput + a).toString();
    // }
    // setState(() {
    //   userinput = text;
    // });
  
 

      






// use afterwards
// setState(() {
//                         if (index == 0) {
//                           userinput = '';
//                         } else if (index == 1) {
//                           userinput =
//                               userinput.substring(0, userinput.length - 1);
//                         } else if (index == names.length - 1) {
//                           output += userinput;
//                         } else if (index == names.length - 2) {
//                           userinput = '';
//                           output = '';
//                         } else {
//                           userinput += names[index];
//                         }
//                       });