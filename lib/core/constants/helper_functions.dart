import 'package:intl/intl.dart';

String getDateTimeNow() {
  final currentDate = DateTime.now();
  final date = DateTime(currentDate.year, currentDate.month, currentDate.day);
  final formatter = DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(date);
  DateTime dateTime = formatter.parse(formatted);
  return formatted;
}