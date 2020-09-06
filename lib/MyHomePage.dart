import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
    Color contentColor = Colors.white;

 @override
 Widget build(BuildContext context) {
   return _buildBody(context);
 }

 Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Simple",),
              Tab(text: "Medium"),
              Tab(text: "Advance"),

            ],
          ),
          title: Text('Interview Questions'),
        ),

     drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              
              accountEmail: new Text("bramvbilsen@gmail.com"),
              accountName: new Text("Bramvbilsen"),
              
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),
            new ListTile(
              title: new Text("iOS"),
              trailing: new Icon(Icons.arrow_right),

              onTap: () {
                setState((){ contentColor = Colors.white;
                Navigator.of(context).pop();
                });
              }
            ),
            new ListTile(
              title: new Text("Android"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                 setState((){ contentColor = Colors.red;
                Navigator.of(context).pop();
                });
              }
            ),

            new Divider(),
          ],
        ),
      ),
        body: Container(
         color: contentColor,
          child: TabBarView(
            children: [
              Center( child: listOfQA(context)),  
              Center( child: listOfQA(context)),
              Center( child: listOfQA(context))
            ],
          ),
        ),
      ),
    );
  }

 Widget page1(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Simple",),
              Tab(text: "Medium"),
              Tab(text: "Advance"),
            ],
          ),
          title: Text('Interview Questions'),
        ),

        body: TabBarView(
          children: [
            Center( child: listOfQA(context)),  
            Center( child: listOfQA(context)),
            Center( child: listOfQA(context))
          ],
        ),
      ),
    );
  }


 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView( 
     padding: const EdgeInsets.only(top: 20.0),
     //children: Text(snapshot.data.docs()),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   //final record = Record.fromSnapshot(data);

   return Padding(
     key: ValueKey("key"),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text('category'),
      children: [new Text('iOS is an operating system for apple mobile devices. It is a very popular company in mobile handsets. Its competitor is Android.')],
    ),
     ),
   );
 }




  Widget listOfQA(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
     stream: FirebaseFirestore.instance.collection('catalogue').snapshots(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) return LinearProgressIndicator();
       return _buildList(context, snapshot.data.docs);
     },
   );
 }
}