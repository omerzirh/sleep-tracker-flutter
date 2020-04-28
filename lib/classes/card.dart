import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'record.dart';
class RecordCard extends StatelessWidget {
  final Record record;
  RecordCard({this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
        child: Column(
            children: <Widget>[
               ListTile(

                leading:  Container(
                      padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black,width: 1.0 )),
                    ),
                    child: Text(
                      record.date, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),


                title: Text(record.type, style: TextStyle(color: Colors.blueAccent)),

                subtitle: Text(record.duration, style: TextStyle(color: Colors.grey)),

              ),
            ]),
    );
  }
}

