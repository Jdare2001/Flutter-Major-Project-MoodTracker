String todaysDateFormatedString() {
  var DTObject = DateTime.now();

  String day = DTObject.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }
  String month = DTObject.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }
  String year = DTObject.year.toString();

  String finalFormat = year + month + day;
  return finalFormat;
}
