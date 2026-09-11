import 'package:flutter_test/flutter_test.dart';
import 'package:lunify_ajanda/main.dart';

void main() {
  testWidgets('yıllık ajanda açılır', (tester) async {
    await tester.pumpWidget(const LunifyAjanda());
    expect(find.textContaining('Ajandam'), findsOneWidget);
    expect(find.text('Ocak'), findsOneWidget);
  });
}
