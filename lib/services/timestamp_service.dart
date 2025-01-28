// intl =  international time
import 'package:intl/intl.dart';

void setDateTime(Function(String, String, String) onDateTimeSet) {
  var dateNow = DateTime.now();
  // day - month - year
  var dateFormat = DateFormat('dd mm yyyy');
  // hour - minute - second
  var dateTime = DateFormat('hh:mm:ss');

  String date = dateFormat.format(dateNow);
  String time = dateTime .format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeSet(date, time, currentDate);
}

void setAttendanceStatus(Function(String) onStatusSet){
  var dateNow = DateTime.now();
  var hour = int.parse(DateFormat('HH').format(dateNow));
  var minute = int.parse(DateFormat('mm').format(dateNow));

  String attendanceStatus;
  // klo misalkan dibawah jam 7 atau 7.30
  if (hour < 7 || (hour == 7 && minute <= 00)) {
    attendanceStatus = "Attend";
  } else if (hour > 7 || (hour == 7 && minute >= 01)) {
    attendanceStatus = "Late";
  } else {
    attendanceStatus = "Absent";
  }

  onStatusSet(attendanceStatus);
}