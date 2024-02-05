import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/main.dart';

void main() {
  testWidgets('Todo List App UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Check if the AppBar title is present
    expect(find.text('Todo List'), findsOneWidget);

    // Check if the floating action button to add a new todo is present
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}