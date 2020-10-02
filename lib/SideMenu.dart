
 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:improve_skill/Record.dart';
import 'package:improve_skill/Widgets.dart';

typedef OnSelectSubject(Subjects subject, int index);

final List<String> _listViewData = [
   Subjects.ios.title(),
   Subjects.flutter.title(),
   "switchBlock",
  ];

Widget sideMenu(BuildContext context, int _selectedIndex ,OnSelectSubject funcCallback) {
   String backgroundImageUrl = "https://pbs.twimg.com/media/Dd_k9f0V4AIrAGw.png";
  return  SizedBox.expand (
      child:   Column(
     children:<Widget>[
    Container(
        width: double.infinity,
          height: 200,
  child: new UserAccountsDrawerHeader(
              accountEmail: new Text("techInterview@yopmail.com"),
              accountName: new Text("Tech Interview"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(backgroundImageUrl),
                  fit: BoxFit.fill
                )
              ),
            )
            
    ), 
    
        Container(
          width: double.infinity,
          height: 300,
      child:   new ListView.builder(
                      itemCount: _listViewData.length,
                      itemBuilder: (context, index) { 
                        if (index == _listViewData.length - 1) {
                            return Container(child: switchBlock(context),
                          );
                        } else {
                            return 
                            Container( color: _selectedIndex != null && _selectedIndex == index
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).backgroundColor,
                              child: ListTile( 
                              title: Text(_listViewData[index]),
                              onTap: () {
                                 funcCallback(_listViewData[index].toSubject(), index);
                                  Navigator.of(context).pop();
                              },
                            ),
                          );
                        }
                       },
                    ), 
        )
        
      ],
)//);
);
}