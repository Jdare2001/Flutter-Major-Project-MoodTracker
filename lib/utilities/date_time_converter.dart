//returns todays date as a string with no time
String todaysDateFormatedString() {
  var dtObject = DateTime.now();

  String finalFormat = dateFormattedToString(dtObject);
  return finalFormat;
}

//returns date as a string with no time
String dateFormattedToString(DateTime dtObject) {
  String day = dtObject.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }
  String month = dtObject.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }
  String year = dtObject.year.toString();

  String finalFormat = year + month + day;
  return finalFormat;
}

//converts string to date time object
DateTime dateFormatedToDateTime(String date) {
  DateTime dtObject = DateTime.parse(date);

  return dtObject;
}

//gets date as an interger (just gets YYYY/MM/DD)
int getXDaysAgo(int x) {
  DateTime todaysDate = DateTime.now();
  DateTime aWeekAgoDate = todaysDate.subtract(Duration(days: x));
  String aWeekAgoDateString = dateFormattedToString(aWeekAgoDate);
  return int.parse(aWeekAgoDateString);
}
