import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get dateDdMMyyyy {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}