import 'package:intl/intl.dart';

class Util{
  //add secure key
  static String appId = 'e7db556f459941df6daaee5cdfb0a0ca';
  // format date
  static String getFormattedDate(DateTime dateTime){
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}