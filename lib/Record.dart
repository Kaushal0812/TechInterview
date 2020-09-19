import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
 final String name;
 final DocumentReference reference;

// Record.fromMap(Map<String, dynamic> map, {this.reference})
 Record.fromMap(Map<String, dynamic> map, {this.reference})
     :name = "YTD";//map['what  is ios'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

enum Subjects{
   ios,  
   android,
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
