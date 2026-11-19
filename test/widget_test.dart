
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/main.dart';

void main() {
  testWidgets('Welcome screen displays correctly', (
      WidgetTester tester,
      ) async {
    // Build our application.
    await tester.pumpWidget(const FoodDeliveryApp());

    // Verify welcome screen content.
    expect(
      find.text('Welcome to Smart Food Delivery System'),
      findsOneWidget,
    );

    expect(
      find.text('Fast, fresh deliveries right to your door'),
      findsOneWidget,
    );

    expect(
      find.text('CLICK TO CONTINUE'),
      findsOneWidget,
    );

    expect(
      find.text('CONTINUE'),
      findsOneWidget,
    );
  });
}
