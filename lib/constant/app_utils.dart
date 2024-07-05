import 'package:intl/intl.dart';

class AppUtils {
  static String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return formatter.format(amount);
  }
}
