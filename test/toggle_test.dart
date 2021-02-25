import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  final Key toggleKey = UniqueKey();
  const text_on = 'on';
  const text_off = 'Off';
  const enabledtextStyle = TextStyle(fontSize: 14, color: Colors.green);
  const disabledtextStyle = TextStyle(fontSize: 14, color: Colors.brown);

  //   testWidgets('GFToggle without Value', (tester) async {
  //   // `GFBUtton.shape` null or `GFBUtton.padding` null.
  //   expect(
  //     () => GFToggle(
  //       value: null,
  //       onChanged: (val){},
  //     ),
  //     throwsAssertionError,
  //   );
  // });

  testWidgets('Enabled & Disabled GFToggle can be constructed ',
      (tester) async {
    final GFToggle toggle = GFToggle(
      key: toggleKey,
      value: null,
      onChanged: null,
      enabledText: text_on,
      disabledText: text_off,
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    expect(app.toggle.enabledText, text_on);
    expect(app.toggle.disabledText, text_off);

    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    await tester.pumpWidget(app);
  });

  testWidgets('Enabled &  Disabled TextStyle GFToggle can be constructed ',
      (tester) async {
    final GFToggle toggle = GFToggle(
      key: toggleKey,
      value: null,
      onChanged: null,
      enabledTextStyle: enabledtextStyle,
      disabledTextStyle: disabledtextStyle,
      type: GFToggleType.ios,
      boxShape: BoxShape.rectangle,
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    expect(app.toggle.enabledTextStyle, enabledtextStyle);
    expect(app.toggle.disabledTextStyle, disabledtextStyle);

    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    await tester.pumpWidget(app);
  });

  testWidgets(
      ' GFToggle can be constructed with standard type and shape i.e default',
      (tester) async {
    final GFToggle toggle = GFToggle(
      key: toggleKey,
      onChanged: null,
      value: null,
      type: GFToggleType.ios,
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    expect(app.toggle.type, GFToggleType.ios);
    expect(app.toggle.onChanged, null);
    expect(app.toggle.value, null);

    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    await tester.pumpWidget(app);
  });

  testWidgets(' GFToggle with custom and other shape', (tester) async {
    const type_custom = GFToggleType.custom;
    const borderRadius = BorderRadius.zero;
    const boxShape = BoxShape.rectangle;

    final GFToggle toggle = GFToggle(
      key: toggleKey,
      onChanged: null,
      value: null,
      type: type_custom,
      borderRadius: borderRadius,
      boxShape: boxShape,
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    expect(app.toggle.type, type_custom);

    expect(app.toggle.borderRadius, borderRadius);

    expect(app.toggle.boxShape, boxShape);

    expect(app.toggle.onChanged, null);
    expect(app.toggle.value, null);

    await tester.tap(find.byKey(toggleKey));
    await tester.pump();
    await tester.pumpWidget(app);
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
