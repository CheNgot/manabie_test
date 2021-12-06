// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:manabie_interview/base/database/database.dart';

import 'package:manabie_interview/main.dart';

void main() {
  testWidgets('find widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Get.lazyPut(()=>AppDb);
    await tester.pumpWidget( MyApp());
    // Verify that our counter starts at 0.
    Get.lazyPut(()=>AppDb);

    expect(find.text('All task'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);
    expect(find.text('In Progress'), findsOneWidget);


    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
