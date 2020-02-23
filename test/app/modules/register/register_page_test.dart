import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:ranking_challenge/app/modules/register/register_page.dart';

main() {
  testWidgets('RegisterPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(RegisterPage(title: 'Register')));
    final titleFinder = find.text('Register');
    expect(titleFinder, findsOneWidget);
  });
}
