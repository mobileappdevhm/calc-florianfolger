import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Calculator(),
    );
  }
}

class CalcLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    // creating the appbar title
    return new Scaffold(
      appBar:new AppBar(
        title:new Text("Calculator")
      ),
      // building the layout for my calculator app
      body: new Column(
        children: <Widget>[
          // upperside
          new Expanded(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              // background color
              color: Colors.white,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // solved the problem that too much digits added to the teststring is running into a 
                  // pixel error on the display
                  new Expanded(
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    child: new Text(
                    mainState.inputValue ?? '0',
                    style: new TextStyle(
                      // text color, size and weight
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            // flex is moving the textfield to the upperside 
            flex: 3,
            // downside with the button fields
            child: new Container(
              child: new Column(
                // buttons
                children: <Widget>[
                  createButtons('C<%x'),
                  createButtons('789/'),
                  createButtons('456-'),
                  createButtons('123+'),
                  createButtons(' 0.='),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
  // saving the buttons into a list
  Widget createButtons (String row) {
    List<String> button = row.split("");
    return new Expanded(
      flex: 1,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: button.map((e) => new CalcButton(
          keyvalue: e,
        )).toList(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalcState createState() => new CalcState();
}

class CalcState extends State<Calculator> {
  // test string 
  String testString = "";
  double prevValue;
  String value = "";
  String op = 'a';

  // alternative method for operator
  bool isNumber(String str) {
    if(str == null) {
      return false;
    }
    return double.parse(str, (e) => null) != null;
  }

  void onPressed(keyValue) {
    switch(keyValue) {
      // zero everything out
      case "C":
        op = null;
        prevValue = 0.0;
        value = "";
        setState(() => testString = "");
        break;
      break;
      // delete one digit
      case "<":
        op = null;
        value = "";
        if(testString.length > 1) {
          value = testString.substring(0, testString.length - 1);
          setState(() => testString = value);
        } else {
          value = testString.substring(0, testString.length - 1);
          setState(() => testString = value);
        }
        break;
      case ".":
        op = keyValue;
        value = "";
        setState(() => testString += ".");
      break;
      case "/":
      case "x":
      case "-":
      case "+":
      case "%":
        op = keyValue;
        value = '';
        prevValue = double.parse(testString);
        setState(() {
          testString = testString + keyValue;
        });
        break;
      case "=":
        if(op != null) {
          setState(() {
            switch(op) {
              case "/":
                testString = (prevValue / double.parse(value)).toStringAsFixed(2);
                break;
              case "x":
                testString = (prevValue * double.parse(value)).toStringAsFixed(2);
                break;
              case "-":
                testString = (prevValue - double.parse(value)).toStringAsFixed(2);
                break;
              case "+":
                testString = (prevValue + double.parse(value)).toStringAsFixed(2);
                break;
              case "%":
                testString = (prevValue % double.parse(value)).toStringAsFixed(2);
                break;
            }
          });
          op = null;
          prevValue = double.parse(testString);
          value = '';
          break;
        }
      break;
      default: 
        if(isNumber(keyValue)) {
          // testing if an operator was set
          if(op != null) {
            setState(() => testString = testString + keyValue);
            value = value + keyValue;
          } else {
            setState(() => testString  = "" + keyValue);
            op = 'a';
          }
        } else {
          onPressed(keyValue);
        }
    }
  }  

  @override
  Widget build(BuildContext context) {
    return new MainState(
      inputValue: testString,
      prevValue: prevValue,
      value: value,
      op: op,
      onPressed: onPressed,
      child: new CalcLayout(),
    );
  }
}

class MainState extends InheritedWidget {
   MainState({
    Key key,
    this.inputValue,
    this.prevValue,
    this.value,
    this.op,
    this.onPressed,
    Widget child,
  }): super(key: key, child: child);

  final String inputValue;
  final double prevValue;
  final String value;
  final String op; // operator
  final Function onPressed;

  static MainState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MainState);
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return inputValue != oldWidget.inputValue;
  }

}

class CalcButton extends StatelessWidget {

  CalcButton({this.keyvalue});

  final String keyvalue;

  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return new Expanded(
      flex: 1,
      child: new FlatButton(
        shape: new Border.all(
          color: Colors.grey,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        color: Colors.white,
        child: new Text(
          keyvalue,
          style: new TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 36.0,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
        ),
        onPressed: () {
          mainState.onPressed(keyvalue);
         },
      ),
    );
  }
}

