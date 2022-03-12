import 'package:flutter/material.dart';

class DataUtils{
  static dateTimeToString({
    required DateTime dateTime,
}){
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${intToPadded(dateTime.hour)}:${intToPadded(dateTime.minute)}';
  }

  static intToPadded(int number){
    return number.toString().padLeft(2, '0');
  }
}
