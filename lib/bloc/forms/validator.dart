  String isNumeric(String val) {
    return double.tryParse(val) != null ? null : "$val is not a number.";
  }