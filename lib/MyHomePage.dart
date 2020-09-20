import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Record.dart';

CollectionReference collectionReference = FirebaseFirestore.instance.collection('catalogue');  

var quizData = [
  
  {"q":"",
  "a":""}
  
  ];
class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
    Subjects currentSubject = Subjects.flutter;
    final category = QuizCategory.advance;

    TabController _tabController;
    int _selectedTabIndex = 0;
   List<Widget> _tabs  = [
              Tab(text: QuizCategory.simple.capitalise()),
              Tab(text: QuizCategory.medium.capitalise()),
              Tab(text: QuizCategory.advance.capitalise()),
            ];
  @override        
  void initState(){
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    //saveToFirestore(category);
    _tabController.addListener(() {
        setState(() {
        _selectedTabIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
     });
  }

  void saveToFirestore(QuizCategory category){

    quizData.forEach((element) {
       collectionReference.doc(currentSubject.value()).collection(category.value()).add({
      "q": element['q'],
      "a": element['a']
  }).then((_) {
    print("success!");
  });
    });

  
}

 @override
 Widget build(BuildContext context) {
   return _buildBody(context);
 }

 Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _tabs,
            onTap: (index) {
             // print("index tapped");
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _tabController,
          ),
          title: Text('Interview Questions'),
        ),

     drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              
              accountEmail: new Text("techInterview@yopmail.com"),
              accountName: new Text("Tech Interview"),
              
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),
            new ListTile(
              title: new Text(Subjects.ios.title()),
              trailing: new Icon(Icons.arrow_right),

              onTap: () {
                setState((){ currentSubject = Subjects.ios;
                Navigator.of(context).pop();
                });
              }
            ),
            new ListTile(
              title: new Text(Subjects.flutter.title()),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                 setState((){ currentSubject = Subjects.flutter;
                Navigator.of(context).pop();
                });
              }
            ),

            new Divider(),
          ],
        ),
      ),
        body: Container(
          child: TabBarView(
            children: [
              Center( child: listOfQA(context)),  
              Center( child: listOfQA(context)),
              Center( child: listOfQA(context))
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

 Widget page1(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _tabs,
          ),
          title: Text('Interview Questions'),
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
            Center( child: listOfQA(context)),  
            Center( child: listOfQA(context)),
            Center( child: listOfQA(context))
          ],
          
        ),
      ),
    );
  }

Widget _buildListItem(DocumentSnapshot document) {
   //final record = Record.fromSnapshot(data);
  final question = document.data()['q'];
  final answer = document.data()['a'];
   return Padding(
     key: ValueKey("key"),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       padding: const EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(question),
      children: [new Text(answer)],
    ),
     ),
   );
 }

  String quizCategory(){
    QuizCategory category  = QuizCategory.simple;
    switch (_selectedTabIndex) {
      case 0: category = QuizCategory.simple;
       break;
      case 1: category = QuizCategory.medium;
      break;
      case 2: category = QuizCategory.advance;
      break;
      default: break;
    }
    return category.value();
  }

  Widget listOfQA(BuildContext context) {

   CollectionReference simpleData = collectionReference.doc(currentSubject.value()).collection(quizCategory());
  
    return StreamBuilder<QuerySnapshot>(
      stream: simpleData.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
               padding: const EdgeInsets.only(top: 20.0),
            children: snapshot.data.docs.map((data) => _buildListItem(data)).toList(),

        );
      },
    );
}

}