import 'package:doctordashboard/profile_settings.dart';
import 'package:doctordashboard/services.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'package:dart:html';
import 'appointment_screen.dart';

void main() => runApp(Patientlist());

class Patientlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // "/a": (BuildContext context) => new Profilesettings("Profile Settings"),
        "/b": (BuildContext context) =>
            new Appointmentscreen("Appointment_screen"),
        "/c": (BuildContext context) => new Services("Services"),
        "/d": (BuildContext context) => new Profilesettings("profile settings"),
      },
      title: 'Patient list',
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Mystatefullwidget(),
    );
  }
}

class Mystatefullwidget extends StatefulWidget {
  @override
  _Mystatefullwidget createState() => _Mystatefullwidget();
}

class _Mystatefullwidget extends State<Mystatefullwidget> {
// List names
  List names = [
    "Ram",
    "Sham",
    "Ghansham",
    "Suresh",
    "Ramesh",
    "Mahesh",
    "rahul",
    "xyz",
    "pqrs",
    "zaid"
  ];
  List designation = [
    "fever",
    "cough",
    "typhoid",
    "covid-19",
    "cough",
    "typhoid",
    "covid-19",
    "cough",
    "covid-19",
    "malaria",
  ];

  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: cussearchbar, actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (this.cusIcon.icon == Icons.search) {
                this.cusIcon = Icon(Icons.cancel);
                this.cussearchbar = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    //colors: Colors.white,
                    hintText: "Search here",
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                );
              } else {
                this.cusIcon = Icon(Icons.search);
                this.cussearchbar = Text("DashBoard");
              }
            });
          },
          icon: cusIcon,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        )
      ]),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Welcome"),
              accountEmail: new Text("Dr. Himanshu "),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("H"),
                foregroundColor: Colors.black,
              ),
            ),
            // new ListTile(
            //   title: new Text("Home"),
            //   trailing: new Icon(Icons.home),
            //   onTap: () {
            //     // ignore: unnecessary_statements
            //     () => Navigator.of(context).pop();
            //     Navigator.of(context).pushNamed("/a");
            //   },
            // ),
            new ListTile(
              title: new Text("Appointments"),
              trailing: new Icon(Icons.calendar_today),
              onTap: () {
                //() => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/b");
              },
            ),
            new ListTile(
              title: new Text("Services"),
              trailing: new Icon(Icons.medical_services),
              onTap: () {
                // ignore: unnecessary_statements
                () => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/c");
              },
            ),
            new ListTile(
              title: new Text("profile Settings"),
              trailing: new Icon(Icons.settings),
              onTap: () {
                //() => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/d");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 55.0,
                          height: 55.0,
                          //color: Colors.deepPurple[300],
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent,
                            foregroundColor: Colors.white,
                            child: new Text("H"),

                            //backgroundImage: NetworkImage(
                            //"https://image.flaticon.com/icons/png/512/16/16363.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(names[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(designation[index],
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    //reject btn
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Reject",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
