import 'package:flutter_test/flutter_test.dart';
import 'package:flexapp_new/main.dart';

void main() {
  testWidgets('FlexApp opens successfully', (tester) async {
    await tester.pumpWidget(const FlexApp());

    expect(find.byType(FlexApp), findsOneWidget);
  });
}