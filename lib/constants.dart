class Constants {
  static const constAppBarTopPadding = 30.0;
  static const constAppBarBottomPadding = 8.0;
  static const unitButtonMinWidth = 60.0;
  static const appBarFontSize = 22.0;

  static const calculatorDisplayTextSize = 22.0;

/*  static double roundDouble(double value) {
    final intg = (value * 100).round();
    return (intg /100);
  }  */

  static String doubleToString(double value) {
    final intg = (value * 100).round();
    final doubleValue = intg / 100;
    if (doubleValue > 999999) {
      return doubleValue.toStringAsExponential(2);
    } else {
      return doubleValue.toString();
    }
  }

  static String playStoreUrl = 'https://play.google.com/store/apps/details?id=chad.orionsoft.convert_it';
}