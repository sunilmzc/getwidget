import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  testWidgets('Basic Rating Testing', (tester) async {
    const GFRating userrating = GFRating();
    const TestApp app = TestApp(userrating);
    await tester.pumpWidget(app);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('GFListTile Test default cursor', (tester) async {
    final _ratingController = TextEditingController();
    double _userRating = 4.5;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: GFRating(
            value: _userRating,
            showTextForm: true,
            controller: _ratingController,
            suffixIcon: GFButton(
              type: GFButtonType.transparent,
              onPressed: () {},
              child: const Text('Rate'),
            ),
          ),
        ),
      ),
    );
    debugDefaultTargetPlatformOverride = null;
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.userRating);

  final GFRating userRating;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.userRating,
            ],
          ),
        ),
      );
}
