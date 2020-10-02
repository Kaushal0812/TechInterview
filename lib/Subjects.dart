
import 'package:flutter/foundation.dart';

enum Subjects{
   ios,  
   flutter,
}

extension SubjectsExt on String {
  Subjects toSubject() => Subjects.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}
enum QuizCategory {
  simple,
  medium,
  advance
}
extension ExtendedFuntionality on Subjects {
  String title(){
    return value().toUpperCase();
  } 
String value(){
    return this.toString().split('.').last;
  } 
}

extension Extended on QuizCategory {
  String value(){
    return this.toString().split('.').last;
  } 

  String capitalise(){
    final _value = this.value();
  return (_value[0].toUpperCase() + _value.substring(1));
  }
}
