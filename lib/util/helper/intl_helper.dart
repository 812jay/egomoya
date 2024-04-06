import 'package:intl/intl.dart';

class IntlHelper {
  static String priceFormat({
    required double price,
    required String symbol,
  }) {
    final format = NumberFormat('$symbol###,###,###,###');
    if (symbol == '£') {
      final euroFormat = NumberFormat.currency(
        symbol: symbol,
        decimalDigits: 2,
      );
      return euroFormat.format(price);
    }
    return format.format(price);
  }
}
