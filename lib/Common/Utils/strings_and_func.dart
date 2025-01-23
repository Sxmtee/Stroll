import 'package:intl/intl.dart';

String baseUrl = "https://admin.strollapp.com/api/v1";

String formatPrice(String price) {
  // Remove the currency symbol if present
  price = price.replaceAll('₦', '');

  // Parse the price as a double
  double parsedPrice = double.parse(price);

  // Create a NumberFormat for Nigerian Naira
  final formatter = NumberFormat.currency(
      locale: 'en_NG', // Nigerian locale
      symbol: '₦', // Naira symbol
      decimalDigits: 2 // Two decimal places
      );

  // Format the price
  return formatter.format(parsedPrice);
}
