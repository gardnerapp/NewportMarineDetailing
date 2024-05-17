import 'package:intl/intl.dart';

String formatDate(DateTime date){
  return DateFormat('MM-dd-yyyy @ kk:mm a').format(date);
}