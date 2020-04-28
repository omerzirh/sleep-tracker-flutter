import 'package:flutter/material.dart';
import 'package:sleeptracker/classes/card.dart';
import 'package:sleeptracker/classes/record.dart';
import 'package:intl/intl.dart';
import 'package:sleeptracker/values/Strings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<Record> records = [];
  String dateOfDay  = DateFormat("EEEE, dd MMM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Strings.homePageTitle),
        centerTitle: true,

        backgroundColor: Colors.amber[200],
      ),
      body: SafeArea(
        child: Container(
          child:Column(
           children: <Widget>[

          SizedBox(height:20.0 ,),
          Center(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amber,
              child: IconButton(
                icon: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0,),
           Padding(
            padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
            child: Container(
              child: Text(
                Strings.homePageInfoText,
                style: TextStyle(
                  letterSpacing: 0.3,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
           SizedBox(height: 20.0,),
            RaisedButton(
                onPressed: ()async {
                dynamic result = await Navigator.pushNamed(context, '/add_new');
                setState(() {
                  data = {
                    'date' : result['date'],        //gets data
                    'type' : result['type'],
                    'duration' : result['duration'],
                  };
                  records.add(Record(date:data['date'],type:data['type'],duration:data['duration']));
                });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [(Color(0xff374ABE)),(Color(0xff64B6FF))],
                            begin: Alignment.centerLeft,
                            end:Alignment.centerRight
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        Strings.buttonAddNew,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                )
            ),
            SizedBox(height: 50.0,),
            Container(
              child:Align(
                alignment: Alignment(-0.70,0.90),
                child: Text(
                  dateOfDay.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          SizedBox(height: 10.0,),
             Expanded(
               child: ListView(
              reverse: true,
              children: records.map((record) =>RecordCard(
                  record:record,
              )).toList(),
            ),
          )
        ],
      ),
        ),
    ),
    );
  }
}
