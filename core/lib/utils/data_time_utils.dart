import '../core.dart';

extension DataTimeUtilsExtension on DateTime {
  String getFullDateTime() {
    return DateFormat('HH:mm dd.MM.yyyy').format(this);
  }

  String getMonthNameAndYear() {
    return DateFormat('MMMM, yyyy').format(this);
  }

  String getDayNameNumberAndMonth() {
    return DateFormat('EEEE, d MMMM').format(this);
  }
}