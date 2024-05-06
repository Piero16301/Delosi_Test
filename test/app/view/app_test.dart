import 'package:delosi_test/app/app.dart';
import 'package:delosi_test/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const AppPage());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
