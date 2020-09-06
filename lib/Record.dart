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