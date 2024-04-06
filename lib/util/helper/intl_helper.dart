import 'package:intl/intl.dart';

class IntlHelper {
  static String priceFormat({
    required double price,
    required String symbol,
  }) {
    int decimalDigits = symbol == '₩' ? 0 : 2;
    final currencyFormat = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    return currencyFormat.format(price);
  }
}
