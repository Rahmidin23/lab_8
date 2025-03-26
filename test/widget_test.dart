import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/repository/post_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final postRepository = PostRepository();

    await tester.pumpWidget(MyApp(postRepository: postRepository));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
