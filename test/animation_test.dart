import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/widgets.dart';

void main() {
  testWidgets('Animation Slide Transition directly sets correct status',
      (WidgetTester tester) async {
    final AnimationController controller = AnimationController(
      value: 0,
      duration: const Duration(milliseconds: 100),
      vsync: const TestVSync(),
    );
    final Key animationKey = UniqueKey();
    final GFAnimation animation = GFAnimation(
      key: animationKey,
      duration: const Duration(seconds: 2),
      type: GFAnimationType.slideTransition,
      onTap: null,
      controller: controller,
      child: const Text('Slide Animation'),
    );

    final TestApp app = TestApp(animation);
    await tester.pumpWidget(app);
    expect(app.animation.type, GFAnimationType.slideTransition);
    expect(app.animation.onTap, null);
    expect(controller.value, 0.0);
    expect(controller.status, AnimationStatus.dismissed);

    controller.value = 0.5;
    expect(controller.value, 0.5);
    expect(controller.status, AnimationStatus.forward);

    controller.value = 1.0;
    expect(controller.value, 1.0);
    expect(controller.status, AnimationStatus.completed);

    controller.value = 0.5;
    expect(controller.value, 0.5);
    expect(controller.status, AnimationStatus.forward);

    controller.value = 0.0;
    expect(controller.value, 0.0);
    expect(controller.status, AnimationStatus.dismissed);
    controller.reset();
    expect(controller.status, AnimationStatus.dismissed);
    controller.stop();
  });

  testWidgets('AnimationMean control test', (WidgetTester tester) async {
    final AnimationController left = AnimationController(
      value: 0.5,
      vsync: const TestVSync(),
    );
    final AnimationController right = AnimationController(
      vsync: const TestVSync(),
    );

    final AnimationMean mean = AnimationMean(left: left, right: right);
    final Key animationKey = UniqueKey();
    final GFAnimation animation = GFAnimation(
      key: animationKey,
      duration: const Duration(seconds: 2),
      type: GFAnimationType.slideTransition,
      onTap: null,
      controller: left,
      child: const Text('Slide Animation'),
    );

    final TestApp app = TestApp(animation);
    await tester.pumpWidget(app);

    expect(mean, hasOneLineDescription);
    expect(mean.value, equals(0.25));

    final List<double> log = <double>[];
    void logValue() {
      log.add(mean.value);
    }

    mean.addListener(logValue);

    right.value = 1.0;

    expect(mean.value, equals(0.75));
    expect(log, equals(<double>[0.75]));
    log.clear();

    mean.removeListener(logValue);

    left.value = 0.0;

    expect(mean.value, equals(0.50));
    expect(log, isEmpty);
  });

  testWidgets('RotationTransition animates', (WidgetTester tester) async {
    AnimationController controller;
    Animation<double> animation;

    controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: const TestVSync());
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final Widget widget = GFAnimation(
      turnsAnimation: animation,
      controller: controller,
      type: GFAnimationType.rotateTransition,
      alignment: Alignment.topRight,
      child: const Text('Rotation', textDirection: TextDirection.ltr),
    );

    await tester.pumpWidget(widget);
    Transform actualRotatedBox = tester.widget(find.byType(Transform));
    Matrix4 actualTurns = actualRotatedBox.transform;
    expect(actualTurns, equals(Matrix4.rotationZ(0)));

    controller.value = 0.5;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi));

    controller.value = 0.75;
    await tester.pump();
    actualRotatedBox = tester.widget(find.byType(Transform));
    actualTurns = actualRotatedBox.transform;
    expect(actualTurns, Matrix4.rotationZ(math.pi * 1.5));
  });

  testWidgets('Scale Transition animations', (WidgetTester tester) async {
    final List<ScaleStartDetails> startDetails = <ScaleStartDetails>[];
    final List<ScaleUpdateDetails> updateDetails = <ScaleUpdateDetails>[];
    final Key redContainer = UniqueKey();
    await tester.pumpWidget(
      Center(
        child: GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              startDetails.add(details);
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              updateDetails.add(details);
            },
            child: Container(
                key: redContainer,
                width: 100,
                height: 100,
                color: Colors.red,
                child: GFAnimation(
                  duration: const Duration(milliseconds: 200),
                  type: GFAnimationType.scaleTransition,
                  child: Container(
                    width: 100,
                    height: 100,
                  ),
                ))),
      ),
    );

    await tester.startGesture(
        tester.getCenter(find.byKey(redContainer)) - const Offset(20, 20));
    final TestGesture pointer2 = await tester.startGesture(
        tester.getCenter(find.byKey(redContainer)) + const Offset(30, 30));
    await pointer2.moveTo(
        tester.getCenter(find.byKey(redContainer)) + const Offset(20, 20));

    expect(updateDetails.single.localFocalPoint, const Offset(50, 50));
    expect(updateDetails.single.focalPoint, const Offset(400, 300));

    expect(startDetails, hasLength(2));

    expect(startDetails.first.localFocalPoint, const Offset(30, 30));
    expect(startDetails.first.focalPoint, const Offset(380, 280));
    expect(startDetails.last.localFocalPoint, const Offset(50, 50));
    expect(startDetails.last.focalPoint, const Offset(400, 300));
  });

  testWidgets('Animation can be constructed with properties', (tester) async {
    const textStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey);
    const padding = EdgeInsets.symmetric(horizontal: 50, vertical: 10);
    const text = Text('hello');
    final Key animationKey = UniqueKey();
    final GFAnimation animation = GFAnimation(
        key: animationKey,
        duration: const Duration(seconds: 5),
        alignment: Alignment.centerLeft,
        child: text,
        type: GFAnimationType.rotateTransition,
        width: 300,
        height: 400,
        activeColor: Colors.greenAccent,
        color: Colors.amberAccent,
        padding: padding,
        onTap: null,
        style: textStyle,
        textAlign: TextAlign.left,
        textOverflow: TextOverflow.ellipsis,
        maxLines: 4,
        textWidthBasis: TextWidthBasis.parent,
        fontSize: 40,
        fontWeight: FontWeight.w300,
        changedWidth: 40,
        changedHeight: 80,
        reverseDuration: const Duration(seconds: 5));

    final TestApp app = TestApp(animation);
    await tester.pumpWidget(app);
    expect(app.animation.width, 300);
    expect(app.animation.type, GFAnimationType.rotateTransition);
    expect(app.animation.reverseDuration, const Duration(seconds: 5));
    expect(app.animation.padding, padding);
    expect(app.animation.child, text);
    expect(app.animation.style, textStyle);
    expect(app.animation.activeColor, Colors.greenAccent);
    expect(app.animation.color, Colors.amberAccent);
  });
}

class TestApp extends StatefulWidget {
  const TestApp(this.animation);

  final GFAnimation animation;

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: widget.animation,
        ),
      );
}


