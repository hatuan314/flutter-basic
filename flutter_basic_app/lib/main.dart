import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_app/presentation/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}