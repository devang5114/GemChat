import 'package:intl/intl.dart';

extension DateTimeFormateExtention on DateTime{
  String format(String format){
    return DateFormat(format).format(this);
  }
}