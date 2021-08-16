class FlutterUtil {
  static final RegExp _dateRegExp = RegExp(
      r'^\d{4}[\-\/\.]((0[1-9])|(1[012]))[\-\/\.]((0[1-9]|[1-2][0-9]|3[0-1]))');

  static String dateString(String? dateString) {
    if (dateString == null) {
      return "";
    }
    String date = dateString;
    return _dateRegExp.stringMatch(date) ?? date;
  }
}
