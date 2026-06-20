import 'package:intl/intl.dart';
class DateTimeGenerator {
  static String barCodeGenerator() {
    String dateTime = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    return dateTime;
  }
  static String currentDateTime() {
    String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    return dateTime;
  }
}
