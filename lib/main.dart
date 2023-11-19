import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlays"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.green.withOpacity(0.2),
                  builder: (_) {
                    //return Container()
                    return AlertDialog(
                      title: Text('Delete'),
                      //backgroundColor: Colors.blue,
                      shadowColor: Colors.blue,
                      elevation: 21,
                      icon: Icon(Icons.delete),
                      content: Text('are you sure want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        )
                      ],
                    );
                  });
            },
            child: Text("Alert dialog")),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.green.withOpacity(0.2),
                  builder: (_) {
                    //return Container()
                    return SimpleDialog(
                      contentPadding: EdgeInsets.symmetric(horizontal: 11),
                      title: Text("Select a Language"),
                      children: [
                        Text('Hindi'),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("English"),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("German"),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("French"),
                        ),
                      ],
                    );
                  });
            },
            child: Text("Simple dialog")),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.green.withOpacity(0.2),
                  builder: (_) {
                    //return Container()
                    return AboutDialog(
                      applicationVersion: "v1.0",
                      applicationName: "classico",
                      applicationIcon: Icon(Icons.account_circle_rounded),
                      applicationLegalese: "This app is about dialog",
                    );
                  });
            },
            child: Text("About dialog")),
        ElevatedButton(
            onPressed: () {
              showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: "custom",
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 21),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: Colors.white),
                        height: 250,
                        child: Material(
                          borderRadius: BorderRadius.circular(21),
                          //color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(),
                                TextField(),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Add")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        //color: Colors.white,
                      ),
                    );
                  });
            },
            child: Text("Custom dialog")),
        ElevatedButton(
            onPressed: () async {
              var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000, 9, 29),
                  lastDate: DateTime.now());
              if (selectedDate != null) {
                print("SelectedDate: ${selectedDate.day}/"
                    "${selectedDate.month}/"
                    "${selectedDate.year}/");
              }
            },
            child: Text("Date Picker")),
        ElevatedButton(
            onPressed: () async {
              var selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()));
              //TimeOfDay(hour: 5, minute: 10));
              if (selectedTime != null) {
                print(
                    "SelectedDate: ${selectedTime.hour}; ${selectedTime.minute}");
              }
            },
            child: Text("Time Picker"))
      ]),
    );
  }
}
