import 'package:intl/intl.dart';

class SFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en-US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    // assuming a 10 digit US phone number format:
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
    }else{
      return phoneNumber;
    }
  }

}