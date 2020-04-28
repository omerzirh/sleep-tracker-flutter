import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';
import 'package:sleeptracker/values/Strings.dart';

class AddNewRecord extends StatefulWidget {
  @override
  _AddNewRecordState createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
double _currentNum= 0.00;
int hour,minute;
String durationText="-";

String dateToShow  = DateFormat("dd MMMM yyyy, HH:mm").format(DateTime.now()); //date with hours shows on card
String dateHour = DateFormat("HH:mm").format(DateTime.now());  //hour to send home page to add list
List<String> _typeOptions = ['Night', 'Nap'];
String sleepType;
void _numberDialog() {
  showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.decimal(
          minValue: 0,
          maxValue: 24,
          decimalPlaces: 2,
          title: new Text(Strings.numberPickerTitle),
          initialDoubleValue: _currentNum,
        );
      }
  ).then(( value) {
    if (value != null) {
      List<String> numbers = new List();
      String timeStr = value.toString();
      numbers = timeStr.split(".");


      hour = int.parse(numbers[0]);
      minute = int.parse(numbers[1]);


      setState(() => durationText = '$hour hours  $minute minutes' );

    }
  });
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Strings.addPageTitle),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    Strings.babyImageUrl,
                  ),
                ),
              ),
             ListTile(

               leading: Padding(
                 padding: const EdgeInsets.fromLTRB(0, 5, 0,0),
                 child: Icon(Icons.date_range, size: 30,color: Colors.blueAccent,),
               ),

               title: Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,0,10),
                 child: Text(Strings.dateTimeTitle, style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold)),
               ),

               subtitle: Text(dateToShow, style: TextStyle(color: Colors.blueAccent)),
             ),
               Divider(
                height: 1.0,
                indent: 1.0,
              ),

              ListTile(

                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0,0),
                    child: Icon(Icons.brightness_2, size: 30,color: Colors.blueAccent,),
                  ),

                  title: Text(Strings.sleepTypeTitle, style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold)),


                  subtitle: Container(
                    child: DropdownButton(
                      hint: Text(Strings.durationHint,style: TextStyle(color: Colors.grey[200]),),
                  value: sleepType,
                  onChanged: (newValue) {
                    setState(() {
                      sleepType = newValue;
                    });
                  },
                  items: _typeOptions.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                  ),
                  ),
              ),
              Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(

                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0,0),
                  child: Icon(Icons.access_time, size: 30,color: Colors.blueAccent,),
                ),

                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,10),
                  child: Text(Strings.durationTitle, style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold)),
                ),

                subtitle: Text(durationText, style: TextStyle(color: Colors.blueAccent)),
                onTap: _numberDialog,
              ),
              SizedBox(height:70.0),
              RaisedButton(
                  onPressed: () async {
                    if(durationText.length > 1 && sleepType.length >1){       //check is options are selected
                    Navigator.pop(context,{
                      'date' : dateHour,
                      'type' : sleepType,                         //send datas to homepage
                      'duration' : durationText,

                    });}else{
                      Fluttertoast.showToast(
                          msg: Strings.buttonToastMsg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    }
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
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),

                        ),
                      )
                  )
              ),
            ],
          ),
        ),

      ),
    );

  }
}
