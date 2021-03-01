import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final Key toggleKey = UniqueKey();
  const text_on = 'on';
  const text_off = 'Off';
  const enabledtextStyle = TextStyle(fontSize: 14, color: Colors.green);
  const disabledtextStyle = TextStyle(fontSize: 14, color: Colors.brown);

  testWidgets('GFToggle can be constructed: default its Disabled',
      (tester) async {
    final GFToggle toggle = GFToggle(
      key: toggleKey,
      value: null,
      onChanged: null,
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(toggleKey));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpWidget(app);
  });

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
    await tester.tap(find.byKey(toggleKey));
    expect(app.toggle.enabledText, text_on);
    expect(app.toggle.disabledText, text_off);
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
    await tester.tap(find.byKey(toggleKey));
    expect(app.toggle.enabledTextStyle, enabledtextStyle);
    expect(app.toggle.disabledTextStyle, disabledtextStyle);
  });

  testWidgets('onPressed is triggered on button tap', (tester) async {
    const bool _isSelected = false;

    final GFToggle toggle = GFToggle(
      key: toggleKey,
      value: _isSelected,
      onChanged: (bool value) {
        value = true;
      },
    );

    final TestApp app = TestApp(toggle);
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(toggleKey));
    expect(_isSelected, isFalse);
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
    await tester.tap(find.byKey(toggleKey));
    expect(app.toggle.type, GFToggleType.ios);
    expect(app.toggle.onChanged, null);
    expect(app.toggle.value, null);
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
    await tester.tap(find.byKey(toggleKey));
    
    expect(app.toggle.type, type_custom);
    expect(app.toggle.borderRadius, borderRadius);
    expect(app.toggle.boxShape, boxShape);
    expect(app.toggle.onChanged, null);
    expect(app.toggle.value, null);
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
