// // import 'package:flutter/material.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:getwidget/getwidget.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/foundation.dart';


// // void main() {
// //   final Key toggleKey = UniqueKey();
// //   const text_on = 'on';
// //   const text_off = 'Off';
// //   const enabledtextStyle = TextStyle(fontSize: 14, color: Colors.green);
// //   const disabledtextStyle = TextStyle(fontSize: 14, color: Colors.brown);

// //   testWidgets('GFToggle can be constructed: default its Disabled',
// //       (tester) async {
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: null,
// //       onChanged: null,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     await tester.pumpAndSettle(const Duration(seconds: 1));
// //     await tester.pumpWidget(app);
// //     // expect(((tester.firstWidget(find.text('on')) as Text).style).color, Colors.green);
// //   });

// //   testWidgets('Enabled & Disabled GFToggle can be constructed ',
// //       (tester) async {
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: null,
// //       onChanged: null,
// //       enabledText: text_on,
// //       disabledText: text_off,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(app.toggle.enabledText, text_on);
// //     expect(app.toggle.disabledText, text_off);
// //   });

// //   testWidgets('Enabled &  Disabled TextStyle GFToggle can be constructed ',
// //       (tester) async {
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: null,
// //       onChanged: null,
// //       enabledTextStyle: enabledtextStyle,
// //       disabledTextStyle: disabledtextStyle,
// //       type: GFToggleType.ios,
// //       boxShape: BoxShape.rectangle,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(app.toggle.enabledTextStyle, enabledtextStyle);
// //     expect(app.toggle.disabledTextStyle, disabledtextStyle);
// //   });

// //   testWidgets('onPressed is triggered on button tap', (tester) async {
// //     const bool _isSelected = false;

// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: _isSelected,
// //       onChanged: (bool value) {
// //         value = true;
// //       },
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(_isSelected, isFalse);
// //   });

// //   testWidgets(
// //       ' GFToggle can be constructed with standard type and shape i.e default',
// //       (tester) async {
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       onChanged: null,
// //       value: null,
// //       type: GFToggleType.ios,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(app.toggle.type, GFToggleType.ios);
// //     expect(app.toggle.onChanged, null);
// //     expect(app.toggle.value, null);
// //   });

// //   testWidgets(' GFToggle with custom and other shape', (tester) async {
// //     const type_custom = GFToggleType.custom;
// //     const borderRadius = BorderRadius.zero;
// //     const boxShape = BoxShape.rectangle;

// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       onChanged: null,
// //       value: null,
// //       type: type_custom,
// //       borderRadius: borderRadius,
// //       boxShape: boxShape,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));

// //     expect(app.toggle.type, type_custom);
// //     expect(app.toggle.borderRadius, borderRadius);
// //     expect(app.toggle.boxShape, boxShape);
// //     expect(app.toggle.onChanged, null);
// //     expect(app.toggle.value, null);
// //   });

// //   testWidgets('GFToggle can be set Color', (tester) async {
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: null,
// //       onChanged: null,
// //       enabledThumbColor: Colors.lightGreen,
// //       enabledTrackColor: Colors.grey,
// //       disabledTrackColor: Colors.white,
// //       disabledThumbColor: Colors.white,
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(toggle.enabledThumbColor, Colors.lightGreen);
// //     expect(
// //       toggle.enabledTrackColor,
// //       Colors.grey,
// //     );
// //     expect(
// //       toggle.disabledThumbColor,
// //       Colors.white,
// //     );
// //     expect(
// //       toggle.disabledTrackColor,
// //       Colors.white,
// //     );
// //   });

// //   testWidgets('GFToggle with BorderRadius set', (tester) async {
// //     // const  borderRadius= 30;
// //     final GFToggle toggle = GFToggle(
// //       key: toggleKey,
// //       value: null,
// //       onChanged: null,
// //       borderRadius: const BorderRadius.all(Radius.circular(30)),
// //     );

// //     final TestApp app = TestApp(toggle);
// //     await tester.pumpWidget(app);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(toggle.borderRadius, const BorderRadius.all(Radius.circular(30)));
// //   });

// //   testWidgets('Switch can toggle on tap', (WidgetTester tester) async {
// //     bool value = false;
// //     await tester.pumpWidget(
// //       Directionality(
// //         textDirection: TextDirection.ltr,
// //         child: StatefulBuilder(
// //           builder: (BuildContext context, StateSetter setState) {
// //             return Material(
// //               child: Center(
// //                 child: GFToggle(
// //                   key: toggleKey,
// //                   value: value,
// //                   onChanged: (bool newValue) {
// //                     setState(() {
// //                       value = newValue;
// //                     });
// //                   },
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );

// //     expect(value, isFalse);
// //     print(value);
// //     await tester.tap(find.byKey(toggleKey));
// //     expect(value, isTrue);
// //     print(value);
// //   });
// // }

// // class TestApp extends StatefulWidget {
// //   const TestApp(this.toggle);

// //   final GFToggle toggle;

// //   @override
// //   _TestAppState createState() => _TestAppState();
// // }

// // class _TestAppState extends State<TestApp> {
// //   @override
// //   Widget build(BuildContext context) => MaterialApp(
// //         home: Scaffold(
// //           body: Column(
// //             children: [
// //               widget.toggle,
// //             ],
// //           ),
// //         ),
// //       );
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:flutter/cupertino.dart';

// void main() {
//   final Key toggleKey = UniqueKey();

//   const enabledTextStyle = TextStyle(color: Colors.green);
//   const disabledTextStyle = TextStyle(color: Colors.red);

//   testWidgets('GFToggle without value', (tester) async {
//     // `GFToggle.value` null, `GFToggle.onChanged` null
//     expect(
//       () => GFToggle(
//         value: null,
//         onChanged: null,
//       ),
//       throwsAssertionError,
//     );
//   });

//   testWidgets('GFToggle can be constructed', (WidgetTester tester) async {
//     bool isSelected = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) => Material(
//           child: Center(
//             child: GFToggle(
//               key: toggleKey,
//               value: isSelected,
//               onChanged: (value) {
//                 setState(() {
//                   isSelected = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );

//     await tester.pumpWidget(toggle);

//     expect(isSelected, isFalse);
//     await tester.tap(find.byKey(toggleKey));
//     await tester.pump();
//     expect(isSelected, isTrue);
//   });

//   testWidgets('GFToggle can be constructed with enabled and disabled Text',
//       (tester) async {
//     bool isOn = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//     );

//     // final TestApp app = TestApp(toggle);
//     await tester.pumpWidget(toggle);

//     // find toggle by key
//     expect(find.byKey(toggleKey), findsOneWidget);

//     // find text 'OFF'
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('OFF');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('OFF');
//       }
//       return false;
//     }), findsOneWidget);

//     // tap on text 'OFF;
//     await tester.tap(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('OFF');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('OFF');
//       }
//       return false;
//     }));

//     // Rebuild the widget after the state has changed.
//     await tester.pump();

//     // find text 'ON'
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('ON');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('ON');
//       }
//       return false;
//     }), findsOneWidget);

//     // tap on text 'ON'
//     await tester.tap(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('ON');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('ON');
//       }
//       return false;
//     }));

//     // Rebuild the widget after the state has changed.
//     await tester.pump(const Duration(milliseconds: 500));

//     // find text 'OFF'
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('OFF');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('OFF');
//       }
//       return false;
//     }), findsOneWidget);
//   });

//   testWidgets('GFToggle with enabled and disabled color',
//       (WidgetTester tester) async {
//     bool isOn = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//     );

//     // find toggle  key
//     await tester.pumpWidget(toggle);

//     // finds value false
//     expect(isOn, isFalse);

//     // find disabled color, finds one widget
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget.decoration != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.color == Colors.amber;
//         }
//       }
//       return false;
//     }), findsOneWidget);

//     // finds enabled color, finds nothing
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget.decoration != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.color == Colors.teal;
//         }
//       }
//       return false;
//     }), findsNothing);

//     // tap on text 'OFF'
//     await tester.tap(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('OFF');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('OFF');
//       }
//       return false;
//     }));

//     // Rebuild the widget after the state has changed.
//     await tester.pump();

//     // finds value true
//     expect(isOn, isTrue);

//     // finds enabled color, finds one widget
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget.decoration != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.color == Colors.teal;
//         }
//       }
//       return false;
//     }), findsOneWidget);

//     // finds disabled color, finds nothing
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget.decoration != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.color == Colors.amber;
//         }
//       }
//       return false;
//     }), findsNothing);
//   });

//   testWidgets('GFToggle with borderRadius and boxShape',
//       (WidgetTester tester) async {
//     bool isOn = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//     );

//     // find toggle  key
//     await tester.pumpWidget(toggle);

//     // finds value false
//     expect(isOn, isFalse);

//     // find border radius, finds one widget
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget.decoration != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.borderRadius ==
//               const BorderRadius.all(Radius.circular(4));
//         }
//       }
//       return false;
//     }), findsOneWidget);

//     // find boxShape, rectangle
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is PhysicalModel) {
//         final PhysicalModel toggleWidget = widget;
//         if (toggleWidget.shape != null) {
//           final PhysicalModel toggle = toggleWidget;
//           return toggle.shape == BoxShape.rectangle;
//         }
//       }
//       return false;
//     }), findsOneWidget);
//   });

//   testWidgets('GFToggle with enabled and disabled textStyle',
//       (WidgetTester tester) async {
//     bool isOn = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   enabledTextStyle: enabledTextStyle,
//                   disabledTextStyle: disabledTextStyle,
//                   disabledThumbColor: Colors.amber,
//                   disabledTrackColor: Colors.amberAccent,
//                   enabledThumbColor: Colors.teal,
//                   enabledTrackColor: Colors.tealAccent,
//                   boxShape: BoxShape.rectangle,
//                   borderRadius: const BorderRadius.all(Radius.circular(4)),
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//     );

//     // find toggle  key
//     await tester.pumpWidget(toggle);

//     // finds value false
//     expect(isOn, isFalse);

//     // find disabled text color
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.style.color == disabledTextStyle.color;
//         }
//       }
//       return false;
//     }), findsOneWidget);

//     // find enabled text color
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.style.color == enabledTextStyle.color;
//         }
//       }
//       return false;
//     }), findsNothing);

//     // tap on text 'OFF'
//     await tester.tap(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.data.contains('OFF');
//         }
//         return toggleWidget.textSpan.toPlainText().contains('OFF');
//       }
//       return false;
//     }));

//     // Rebuild the widget after the state has changed.
//     await tester.pump();

//     // find disabled text color
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.style.color == disabledTextStyle.color;
//         }
//       }
//       return false;
//     }), findsNothing);

//     // find enabled text color
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is Text) {
//         final Text toggleWidget = widget;
//         if (toggleWidget.data != null) {
//           return toggleWidget.style.color == enabledTextStyle.color;
//         }
//       }
//       return false;
//     }), findsOneWidget);
//   });

//   testWidgets('GFToggle with type ios', (WidgetTester tester) async {
//     bool isOn = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) => Material(
//                 child: GFToggle(
//                   key: toggleKey,
//                   value: isOn,
//                   enabledText: 'ON',
//                   disabledText: 'OFF',
//                   type: GFToggleType.ios,
//                   onChanged: (value) {
//                     setState(() {
//                       isOn = value;
//                     });
//                   },
//                 ),
//               )),
//     );

//     // find toggle  key
//     await tester.pumpWidget(toggle);

//     // finds value false
//     expect(isOn, isFalse);

//     // find toggle type, ios
//     expect(find.byWidgetPredicate((widget) {
//       if (widget is DecoratedBox) {
//         final DecoratedBox toggleWidget = widget;
//         if (toggleWidget != null) {
//           final BoxDecoration toggle = toggleWidget.decoration;
//           return toggle.shape == BoxShape.circle;
//         }
//       }
//       return false;
//     }), findsOneWidget);
//   });

//   testWidgets('GFToggle can be constructed with long duration',
//       (WidgetTester tester) async {
//     bool isSelected = false;

//     final toggle = Directionality(
//       textDirection: TextDirection.ltr,
//       child: StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) => Material(
//           child: Center(
//             child: GFToggle(
//               key: toggleKey,
//               value: isSelected,
//               onChanged: (value) {
//                 setState(() {
//                   isSelected = value;
//                 });
//               },
//               duration: const Duration(milliseconds: 800),
//             ),
//           ),
//         ),
//       ),
//     );

//     await tester.pumpWidget(toggle);

//     expect(isSelected, isFalse);
//     await tester.tap(find.byKey(toggleKey));
//     await tester.pump();
//     expect(isSelected, isTrue);
//   });

//   testWidgets('GFToggle with all properties.', (WidgetTester tester) async {
//     bool isOn = false;

//     final GFToggle toggle = GFToggle(
//       key: toggleKey,
//       value: isOn,
//       enabledText: 'ON',
//       disabledText: 'OFF',
//       enabledTextStyle: enabledTextStyle,
//       disabledTextStyle: disabledTextStyle,
//       disabledThumbColor: Colors.amber,
//       disabledTrackColor: Colors.amberAccent,
//       enabledThumbColor: Colors.teal,
//       enabledTrackColor: Colors.tealAccent,
//       boxShape: BoxShape.rectangle,
//       borderRadius: const BorderRadius.all(Radius.circular(4)),
//       duration: const Duration(milliseconds: 400),
//       type: GFToggleType.ios,
//       onChanged: (value) {
//         isOn = value;
//       },
//     );

//     final TestApp app = TestApp(toggle);
//     await tester.pumpWidget(app);

//     expect(app.toggle.value, isOn);
//     expect(app.toggle.enabledText, 'ON');
//     expect(app.toggle.disabledText, 'OFF');
//     expect(app.toggle.enabledTextStyle, enabledTextStyle);
//     expect(app.toggle.disabledTextStyle, disabledTextStyle);
//     expect(app.toggle.enabledThumbColor, Colors.teal);
//     expect(app.toggle.enabledTrackColor, Colors.tealAccent);
//     expect(app.toggle.disabledThumbColor, Colors.amber);
//     expect(app.toggle.disabledTrackColor, Colors.amberAccent);
//     expect(app.toggle.boxShape, BoxShape.rectangle);
//     expect(app.toggle.borderRadius, const BorderRadius.all(Radius.circular(4)));
//     expect(app.toggle.duration, const Duration(milliseconds: 400));
//     expect(app.toggle.type, GFToggleType.ios);
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.toggle);
//   final GFToggle toggle;
//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: Column(
//             children: [
//               widget.toggle,
//             ],
//           ),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final Key toggleKey = UniqueKey();

  const enabledTextStyle = TextStyle(color: Colors.green);
  const disabledTextStyle = TextStyle(color: Colors.red);

  // testWidgets('GFToggle without value', (tester) async {
  //   // `GFToggle.value` null, `GFToggle.onChanged` null
  //   expect(
  //     () => GFToggle(
  //       value: null,
  //       onChanged: null,
  //     ),
  //     throwsAssertionError,
  //   );
  // });

  testWidgets('GFToggle can be constructed', (WidgetTester tester) async {
    bool isSelected = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Material(
          child: Center(
            child: GFToggle(
              key: toggleKey,
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(toggle);
    expect(isSelected, isFalse);
    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    expect(isSelected, isTrue);
  });

  testWidgets('GFToggle can be constructed with enabled and disabled Text',
      (tester) async {
    bool isOn = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFToggle(
                  key: toggleKey,
                  value: isOn,
                  enabledText: 'ON',
                  disabledText: 'OFF',
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              )),
    );

    // final TestApp app = TestApp(toggle);
    await tester.pumpWidget(toggle);

    // find toggle by key
    expect(find.byKey(toggleKey), findsOneWidget);

    // find text 'OFF'
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('OFF');
        }
        return toggleWidget.textSpan.toPlainText().contains('OFF');
      }
      return false;
    }), findsOneWidget);

    // tap on text 'OFF;
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('OFF');
        }
        return toggleWidget.textSpan.toPlainText().contains('OFF');
      }
      return false;
    }));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // find text 'ON'
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('ON');
        }
        return toggleWidget.textSpan.toPlainText().contains('ON');
      }
      return false;
    }), findsOneWidget);

    // tap on text 'ON'
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('ON');
        }
        return toggleWidget.textSpan.toPlainText().contains('ON');
      }
      return false;
    }));

    // Rebuild the widget after the state has changed.
    await tester.pump(const Duration(milliseconds: 500));

    // find text 'OFF'
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('OFF');
        }
        return toggleWidget.textSpan.toPlainText().contains('OFF');
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GFToggle with enabled and disabled color',
      (WidgetTester tester) async {
    bool isOn = false;
    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFToggle(
                  key: toggleKey,
                  value: isOn,
                  enabledText: 'ON',
                  disabledText: 'OFF',
                  disabledThumbColor: Colors.amber,
                  disabledTrackColor: Colors.amberAccent,
                  enabledThumbColor: Colors.teal,
                  enabledTrackColor: Colors.tealAccent,
                  boxShape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              )),
    );

    // find toggle  key
    await tester.pumpWidget(toggle);

    // finds value false
    expect(isOn, isFalse);

    // find disabled color, finds one widget
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget.decoration != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.color == Colors.amber;
        }
      }
      return false;
    }), findsOneWidget);

    // finds enabled color, finds nothing
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget.decoration != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.color == Colors.teal;
        }
      }
      return false;
    }), findsNothing);

    // tap on text 'OFF'
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('OFF');
        }
        return toggleWidget.textSpan.toPlainText().contains('OFF');
      }
      return false;
    }));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // finds value true
    expect(isOn, isTrue);

    // finds enabled color, finds one widget
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget.decoration != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.color == Colors.teal;
        }
      }
      return false;
    }), findsOneWidget);

    // finds disabled color, finds nothing
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget.decoration != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.color == Colors.amber;
        }
      }
      return false;
    }), findsNothing);
  });

  testWidgets('GFToggle with borderRadius and boxShape',
      (WidgetTester tester) async {
    bool isOn = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFToggle(
                  key: toggleKey,
                  value: isOn,
                  enabledText: 'ON',
                  disabledText: 'OFF',
                  disabledThumbColor: Colors.amber,
                  disabledTrackColor: Colors.amberAccent,
                  enabledThumbColor: Colors.teal,
                  enabledTrackColor: Colors.tealAccent,
                  boxShape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              )),
    );

    // find toggle  key
    await tester.pumpWidget(toggle);

    // finds value false
    expect(isOn, isFalse);

    // find border radius, finds one widget
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget.decoration != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.borderRadius ==
              const BorderRadius.all(Radius.circular(4));
        }
      }
      return false;
    }), findsOneWidget);

    // find boxShape, rectangle
    expect(find.byWidgetPredicate((widget) {
      if (widget is PhysicalModel) {
        final PhysicalModel toggleWidget = widget;
        if (toggleWidget.shape != null) {
          final PhysicalModel toggle = toggleWidget;
          return toggle.shape == BoxShape.rectangle;
        }
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GFToggle with enabled and disabled textStyle',
      (WidgetTester tester) async {
    bool isOn = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFToggle(
                  key: toggleKey,
                  value: isOn,
                  enabledText: 'ON',
                  disabledText: 'OFF',
                  enabledTextStyle: enabledTextStyle,
                  disabledTextStyle: disabledTextStyle,
                  disabledThumbColor: Colors.amber,
                  disabledTrackColor: Colors.amberAccent,
                  enabledThumbColor: Colors.teal,
                  enabledTrackColor: Colors.tealAccent,
                  boxShape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              )),
    );

    // find toggle  key
    await tester.pumpWidget(toggle);

    // finds value false
    expect(isOn, isFalse);

    // find disabled text color
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.style.color == disabledTextStyle.color;
        }
      }
      return false;
    }), findsOneWidget);

    // find enabled text color
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.style.color == enabledTextStyle.color;
        }
      }
      return false;
    }), findsNothing);

    // tap on text 'OFF'
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.data.contains('OFF');
        }
        return toggleWidget.textSpan.toPlainText().contains('OFF');
      }
      return false;
    }));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // find disabled text color
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.style.color == disabledTextStyle.color;
        }
      }
      return false;
    }), findsNothing);

    // find enabled text color
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text toggleWidget = widget;
        if (toggleWidget.data != null) {
          return toggleWidget.style.color == enabledTextStyle.color;
        }
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GFToggle with type ios', (WidgetTester tester) async {
    bool isOn = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Material(
                child: GFToggle(
                  key: toggleKey,
                  value: isOn,
                  enabledText: 'ON',
                  disabledText: 'OFF',
                  type: GFToggleType.ios,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              )),
    );

    // find toggle  key
    await tester.pumpWidget(toggle);

    // finds value false
    expect(isOn, isFalse);

    // find toggle type, ios
    expect(find.byWidgetPredicate((widget) {
      if (widget is DecoratedBox) {
        final DecoratedBox toggleWidget = widget;
        if (toggleWidget != null) {
          final BoxDecoration toggle = toggleWidget.decoration;
          return toggle.shape == BoxShape.circle;
        }
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GFToggle can be constructed with long duration',
      (WidgetTester tester) async {
    bool isSelected = false;

    final toggle = Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Material(
          child: Center(
            child: GFToggle(
              key: toggleKey,
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value;
                });
              },
              duration: const Duration(milliseconds: 800),
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(toggle);

    expect(isSelected, isFalse);
    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    expect(isSelected, isTrue);
  });

  testWidgets('GFToggle with all properties.', (WidgetTester tester) async {
    bool isOn = false;

    final GFToggle toggle = GFToggle(
      key: toggleKey,
      value: isOn,
      enabledText: 'ON',
      disabledText: 'OFF',
      enabledTextStyle: enabledTextStyle,
      disabledTextStyle: disabledTextStyle,
      disabledThumbColor: Colors.amber,
      disabledTrackColor: Colors.amberAccent,
      enabledThumbColor: Colors.teal,
      enabledTrackColor: Colors.tealAccent,
      boxShape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      duration: const Duration(milliseconds: 400),
      type: GFToggleType.ios,
      onChanged: (value) {
        isOn = value;
      },
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);

    expect(app.toggle.value, isOn);
    expect(app.toggle.enabledText, 'ON');
    expect(app.toggle.disabledText, 'OFF');
    expect(app.toggle.enabledTextStyle, enabledTextStyle);
    expect(app.toggle.disabledTextStyle, disabledTextStyle);
    expect(app.toggle.enabledThumbColor, Colors.teal);
    expect(app.toggle.enabledTrackColor, Colors.tealAccent);
    expect(app.toggle.disabledThumbColor, Colors.amber);
    expect(app.toggle.disabledTrackColor, Colors.amberAccent);
    expect(app.toggle.boxShape, BoxShape.rectangle);
    expect(app.toggle.borderRadius, const BorderRadius.all(Radius.circular(4)));
    expect(app.toggle.duration, const Duration(milliseconds: 400));
    expect(app.toggle.type, GFToggleType.ios);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.toggle);
  final GFToggle toggle;
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.toggle,
            ],
          ),
        ),
      );
}


