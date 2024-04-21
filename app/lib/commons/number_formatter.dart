import 'package:easy_localization/easy_localization.dart';

class NumberFormatter {
  static String formatPrice(dynamic value) {
    if (value == 0 || value == null) {
      return '0';
    }
    var numberFormat = NumberFormat("###,###", "en_US");
    return numberFormat.format(value ?? 0);
  }

  static String formatQtty(dynamic value) {
    if (value == 0 || value == null) {
      return '0';
    }
    var numberFormat = NumberFormat("###,##0", "en_US");
    return numberFormat.format(value ?? 0);
  }
}
