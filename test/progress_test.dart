import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
// import '../rendering/mock_canvas.dart';

void main() {
  final Key progressBarKey = UniqueKey();

  testWidgets(
      'LinearProgressIndicator GFProgressBar can be constructed : default',
      (tester) async {
    final GFProgressBar progressBar = GFProgressBar(
      key: progressBarKey,
      percentage: 0.2,
      backgroundColor: const Color(0xFFB8C7CB),
      progressBarColor: Colors.green,
    );

    final TestApp app = TestApp(progressBar);
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(progressBarKey));

    expect(app.progressBar.percentage, 0.2);
    expect(app.progressBar.progressBarColor, Colors.green);
  });

  testWidgets('CircularProgressIndicator ProgressBar can be constructed :',
      (tester) async {
    final GFProgressBar progressBar = GFProgressBar(
        key: progressBarKey,
        percentage: 0.9,
        width: 100,
        radius: 90,
        type: GFProgressType.circular,
        backgroundColor: Colors.black26,
        progressBarColor: GFColors.DANGER);

    final TestApp app = TestApp(progressBar);
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(progressBarKey));

    expect(app.progressBar.percentage, 0.9);
    expect(app.progressBar.width, 100);
    expect(app.progressBar.radius, 90);
    expect(app.progressBar.type, GFProgressType.circular);
    expect(app.progressBar.backgroundColor, Colors.black26);
    expect(app.progressBar.progressBarColor, GFColors.DANGER);
  });

  testWidgets('Progress bar with leading and trailing icons:', (tester) async {
    const text = Text(
      '80%',
      textAlign: TextAlign.end,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
    const leadingIcons =
        Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER);
    const trailingIcons =
        Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS);
    const align = MainAxisAlignment.spaceBetween;
    final GFProgressBar progressBar = GFProgressBar(
      key: progressBarKey,
      percentage: 0.8,
      lineHeight: 20,
      alignment: align,
      child: text,
      leading: leadingIcons,
      trailing: trailingIcons,
      backgroundColor: Colors.black26,
      progressBarColor: GFColors.INFO,
    );

    final TestApp app = TestApp(progressBar);
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(progressBarKey));

    expect(app.progressBar.percentage, 0.8);
    expect(app.progressBar.lineHeight, 20);
    expect(app.progressBar.alignment, align);
    expect(app.progressBar.leading, leadingIcons);
    expect(app.progressBar.trailing, trailingIcons);
    expect(app.progressBar.progressBarColor, GFColors.INFO);
    expect(app.progressBar.backgroundColor, Colors.black26);
  });

  testWidgets('ProgressIndicator keeps spinning until end of time',
      (tester) async {
    const int animationDuration = 700;
    final GFProgressBar progressBar = GFProgressBar(
      key: progressBarKey,
      percentage: 0.2,
      type: GFProgressType.linear,
      animationDuration: animationDuration,
      backgroundColor: const Color(0xFFB8C7CB),
      progressBarColor: Colors.green,
    );

    final TestApp app = TestApp(progressBar);
    await tester.pumpWidget(app);
    await tester.pump(const Duration(milliseconds: 5));
    await tester.tap(find.byKey(progressBarKey));

    expect(app.progressBar.animationDuration, 700);
    await tester.pump(const Duration(milliseconds: 5));
    expect(app.progressBar.animationDuration, animationDuration);
  });

  testWidgets('GFProgressBar can be constructed with properties ',
      (tester) async {
    final GFProgressBar progressBar = GFProgressBar(
      key: progressBarKey,
      percentage: 0.2,
      circleWidth: 5,
      circleStartAngle: 0,
      backgroundColor: Colors.amber,
      progressBarColor: Colors.red,
      animation: false,
      animationDuration: 700,
      autoLive: true,
      animateFromLastPercentage: false,
      reverse: false,
      type: GFProgressType.linear,
      lineHeight: 5,
      width: 300,
      fromRightToLeft: false,
      alignment: MainAxisAlignment.start,
      clipLinearGradient: false,
    );

    final TestApp app = TestApp(progressBar);
    await tester.pumpWidget(app);
    expect(app.progressBar.percentage, 0.2);
    expect(app.progressBar.circleWidth, 5);
    expect(app.progressBar.circleStartAngle, 0);
    expect(app.progressBar.backgroundColor, Colors.amber);
    expect(app.progressBar.progressBarColor, Colors.red);
    expect(app.progressBar.animation, false);
    expect(app.progressBar.animationDuration, 700);
    expect(app.progressBar.autoLive, true);
    expect(app.progressBar.animateFromLastPercentage, false);
    expect(app.progressBar.reverse, false);
    expect(app.progressBar.lineHeight, 5);
    expect(app.progressBar.type, GFProgressType.linear);
    expect(app.progressBar.width, 300);
    expect(app.progressBar.fromRightToLeft, false);
    expect(app.progressBar.alignment, MainAxisAlignment.start);
    expect(app.progressBar.clipLinearGradient, false);

    await tester.tap(find.byKey(progressBarKey));
    await tester.pump();
    await tester.pumpWidget(app);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.progressBar);

  final GFProgressBar progressBar;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              widget.progressBar,
            ],
          ),
        ),
      );
}
