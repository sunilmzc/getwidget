// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:getwidget/getwidget.dart';

// void main() {
//   testWidgets('Auto Dismissible Toast can be constructed ', (tester) async {
//     final Key toastKey = UniqueKey();
//     const text = 'This item already has the label "travel"';
//     final GFToast toast = GFToast(
//       key: toastKey,
//       text: text,
//       autoDismiss: true,
//     );

//     final TestApp app = TestApp(toast);
//     await tester.pumpWidget(app);
//     expect(app.toast.autoDismiss, true);
//   });
// }

// class TestApp extends StatefulWidget {
//   const TestApp(this.toast);

//   final GFToast toast;

//   @override
//   _TestAppState createState() => _TestAppState();
// }

// class _TestAppState extends State<TestApp> {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: Column(
//             children: [
//               widget.toast,
//             ],
//           ),
//         ),
//       );
// }
