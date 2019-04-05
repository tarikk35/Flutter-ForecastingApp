class IconUrifier {
  
  String getIconUrl(int conditionId) {
    String _iconPath;
    if (conditionId < 233) {
      _iconPath = '11d';
    } else if (conditionId < 322 || (conditionId < 532 && conditionId > 519)) {
      _iconPath = '09d';
    } else if (conditionId < 510) {
      _iconPath = '10d';
    } else if (conditionId < 623 || conditionId == 511) {
      _iconPath = '13d';
    } else if (conditionId < 782) {
      _iconPath = '50d';
    } else if (conditionId == 800) {
      _iconPath = '01d';
    } else if (conditionId == 801) {
      _iconPath = '02d';
    } else if (conditionId == 802) {
      _iconPath = '03d';
    } else if (conditionId == 803 || conditionId == 804) {
      _iconPath = '04d';
    }
    return 'http://openweathermap.org/img/w/$_iconPath.png';
  }
}
