class StringUtil {
  static String capitalize(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  static String getTimeHHMM(DateTime time) {
    var hh = time.hour.toString().padLeft(2, '0');
    var mm = time.minute.toString().padLeft(2, '0');
    return "$hh:$mm";
  }

  static String getDateDM(DateTime time) {
    return "${time.day}/${time.month}";
  }
}
