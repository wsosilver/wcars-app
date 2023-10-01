import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIHelper {
  static void saveStorage(key, inValue) {
    SharedPreferences.getInstance()
        .then((value) => value.setString(key, inValue.toString()));
  }

  static String moneyFormat(double priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static String? toCamelCase(String? nome) {
    if (nome == null || nome == '' || nome == ' ') return null;
    var cadeia = nome.split(' ');
    var result = '';
    var first = '';
    var rest = '';
    for (var element in cadeia) {
      first = element[0].toUpperCase();
      rest = element.substring(1, element.length).toLowerCase();
      // rest = rest.join('');
      element.toLowerCase();

      result += '${first.toUpperCase()}$rest ';
    }

    result = result.trim();

    return result;
  }

  static String? formatDate(DateTime? dateTime, [String? separator]) {
    if (dateTime != null) {
      separator = separator ?? '/';

      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year.toString().padLeft(2, '0');

      return '$day$separator$month$separator$year';
    }

    return null;
  }

  static String formatCpfCnpj(String? valor) {
    if (valor == null) return '';

    if (valor.length == 14) {
      return '${valor.substring(0, 2)}.${valor.substring(2, 5)}.${valor.substring(5, 8)}/${valor.substring(8, 12)}-${valor.substring(12, 14)}';
    } else if (valor.length == 11) {
      return '${valor.substring(0, 3)}.${valor.substring(3, 6)}.${valor.substring(6, 9)}-${valor.substring(9, 11)}';
    }

    return '';
  }

  static void showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  static Future<String?> getStorageString(key) async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString(key));
  }
}
