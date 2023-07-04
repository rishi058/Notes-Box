import 'dart:math';
import 'package:intl/intl.dart';

String formatDate() {
  final DateFormat formatter = DateFormat("E, MMM d, ''yy");
  return formatter.format(DateTime.now());
}

List<String> colors = [
  "0xFFFE9A37", "0xFFCBDB57", "0xFF9585BA", "0xFFF96A4B", "0xFFDEA44D",
  "0xFFFFDDA7", "0xFFE5F099", "0xFFCDC5D0", "0xFFFF8F6E", "0xFFD8A974",
  "0xFFFEF6C1", "0xFFD3EFA6", "0xFFC0B3CC", "0xFFFFB9A0", "0xFFE5C292",
  "0xFFFCF4DC", "0xFFDCECB0", "0xFFCDBAD6", "0xFFFFAB8D", "0xFFE5B97A"
];

Random random = Random();

String randomColor(){
  int index = random.nextInt(20);
  return colors[index];
}

List<double> tileHelper(int index){

  index = index%10;

  switch(index){
    case 0 :   return [1,1];
    case 1 :   return [1,1];
    case 2 :   return [2,1];
    case 3 :   return [1,2];
    case 4 :   return [1,1];
    case 5 :   return [1,1];
    case 6 :   return [2,1];
    case 7 :   return [1,1];
    case 8 :   return [1,2];
    case 9 :   return [1,1];
  }

  return [1,1];
}