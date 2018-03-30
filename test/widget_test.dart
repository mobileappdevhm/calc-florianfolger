// some basic tests for the calculator

import 'package:flutter_test/flutter_test.dart';

import 'package:mycalculator/main.dart';

void main() {

  final Finder button0 = find.text('0');
  final Finder button1 = find.text('1');
  final Finder button2 = find.text('2');
  final Finder button3 = find.text('3');
  final Finder button4 = find.text('4');
  final Finder button5 = find.text('5');
  final Finder button6 = find.text('6');
  final Finder button7 = find.text('7');
  final Finder button8 = find.text('8');
  final Finder button9 = find.text('9');
  final Finder buttonPlus = find.text('+');
  final Finder buttonMinus = find.text('-');
  final Finder buttonDiv = find.text('/');
  final Finder buttonMult = find.text('x');
  final Finder buttonMod = find.text('%');
  final Finder buttonRes = find.text('=');
  final Finder buttonDel = find.text('<');
  final Finder buttonC = find.text('C');


  testWidgets('check buttons function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    expect(button0, findsOneWidget);
    expect(button1, findsOneWidget);
    expect(button2, findsOneWidget);
    expect(button3, findsOneWidget);
    expect(button4, findsOneWidget);
    expect(button5, findsOneWidget);
    expect(button6, findsOneWidget);
    expect(button7, findsOneWidget);
    expect(button8, findsOneWidget);
    expect(button9, findsOneWidget);
    expect(buttonPlus, findsOneWidget);
    expect(buttonMinus, findsOneWidget);
    expect(buttonDiv, findsOneWidget);
    expect(buttonMult, findsOneWidget);
    expect(buttonMod, findsOneWidget);
    expect(buttonRes, findsOneWidget);
    expect(buttonDel, findsOneWidget);
    expect(buttonC, findsOneWidget);

  });

  testWidgets('check Addition function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button1);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();

    expect('3.00', '3.00');

  });

  testWidgets('check subtraction function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonMinus);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();

    expect('3.00', '3.00');

  });

  testWidgets('check mult function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();

    expect('18.00', '18.00');

  });

  testWidgets('check div function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button2);
    await tester.pump();
    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();

    expect('1.00', '1.00');

  });

  testWidgets('check mod function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button4);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();

    expect('0.00', '0.00');

  });

  testWidgets('check clear function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonC);
    await tester.pump();

    expect(' ', ' ');

  });

   testWidgets('check delete function', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonDel);
    await tester.pump();
    await tester.tap(button3);
    await tester.pump();

    expect('9.00', '9.00');

  });

   testWidgets('check several functions', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonPlus);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonRes);
    await tester.pump();

    expect('15.00', '15.00');

    await tester.tap(buttonMinus);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonRes);
    await tester.pump();

    expect('6.00', '6.00');

    await tester.tap(buttonMult);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(buttonRes);
    await tester.pump();

    expect('24.00', '24.00');

    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonRes);
    await tester.pump();

    expect('4.80', '4.80');

  });

  

}
