import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Format: MM/dd/yyyy
  String get mdy => DateFormat('MM/dd/yyyy').format(this);

  /// Format: dd/MM/yyyy
  String get dmy => DateFormat('dd/MM/yyyy').format(this);

  /// Year only: yyyy
  String get yearOnly => DateFormat('yyyy').format(this);

  /// Full month name (e.g., January)
  String get monthName => DateFormat('MMMM').format(this);

  /// Full weekday name (e.g., Monday)
  String get dayName => DateFormat('EEEE').format(this);

  /// Time in 12-hour format (e.g., 02:30 PM)
  String get time12h => DateFormat('hh:mm a').format(this);

  /// Time in 24-hour format (e.g., 14:30)
  String get time24h => DateFormat('HH:mm').format(this);
}