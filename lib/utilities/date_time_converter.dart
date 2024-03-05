String todaysDateFormatedString() {
  var dtObject = DateTime.now();

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
