// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_learn/main.dart';

void main() {
  testWidgets('App starts and shows new grid categories', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    // Verify that our home screen shows the new category buttons.
    expect(find.text('Numbers'), findsOneWidget);
    expect(find.text('Animals'), findsOneWidget);
    expect(find.text('Colors'), findsOneWidget);
    expect(find.text('Shapes'), findsOneWidget);
  });
}
