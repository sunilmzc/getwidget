import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  const iconSize = 24.0;

  final List itemList = <String>['one', 'two', 'three', 'four', 'five', 'Six'];

  testWidgets('GFDropdown without value', (tester) async {
    // `GFDropdown.items` null
    expect(
      () => GFDropdown(
        items: null,
        onChanged: (_) {},
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Dropdown button can be constructed', (tester) async {
    const dropdownKey = Key('header');
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: null,
      onChanged: null,
    );
    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);
    expect(find.byKey(dropdownKey), findsOneWidget);
    await tester.pump();
    expect(app.dropdown.onChanged, null);
    expect(app.dropdown.value, null);
  });

  testWidgets('Dropdown button control can be constructed', (tester) async {
    const dropdownKey = Key('header');
    String value = 'one';
    final GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: itemList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      value: value,
      onChanged: (newValue) {
        value = newValue;
      },
    );

    final TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    await tester.tap(find.text('one'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(value, equals('one'));

    await tester.tap(find.text('Six').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(value, equals('Six'));
  });

  testWidgets('GFDropdown Color Property can be constructed ', (tester) async {
    const dropdownKey = Key('header');
    const GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: null,
      onChanged: null,
      iconDisabledColor: Colors.amber,
      iconEnabledColor: Colors.blue,
      dropdownColor: Colors.redAccent,
      focusColor: Colors.red,
    );

    const TestApp app = TestApp(dropdown);

    await tester.pumpWidget(app);
    expect(app.dropdown.iconDisabledColor, Colors.amber);
    expect(
      app.dropdown.iconEnabledColor,
      Colors.blue,
    );
    expect(
      app.dropdown.dropdownColor,
      Colors.redAccent,
    );
    expect(
      app.dropdown.focusColor,
      Colors.red,
    );

    await tester.tap(find.byKey(dropdownKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });

  testWidgets('GFDropdown Button Property can be constructed', (tester) async {
    const dropdownKey = Key('header');
    const GFDropdown dropdown = GFDropdown(
      key: dropdownKey,
      items: null,
      isDense: true,
      isExpanded: false,
      autofocus: false,
      onChanged: null,
      iconSize: iconSize,
      itemHeight: 40,
      elevation: 8,
    );

    const TestApp app = TestApp(dropdown);
    await tester.pumpWidget(app);

    expect(app.dropdown.iconSize, iconSize);
    expect(app.dropdown.onChanged, null);
    expect(app.dropdown.isExpanded, false);
    expect(app.dropdown.isDense, true);
    expect(app.dropdown.autofocus, false);
    expect(app.dropdown.elevation, 8);
    expect(app.dropdown.itemHeight, 40);

    await tester.tap(find.byKey(dropdownKey));
    await tester.pump();

    await tester.pumpWidget(app);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.dropdown);

  final GFDropdown dropdown;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.dropdown,
            ],
          ),
        ),
      );
}
