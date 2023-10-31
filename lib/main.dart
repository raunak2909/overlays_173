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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
        title: Text('Overlays'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.green.withOpacity(0.2),
                builder: (ctx){
              return AlertDialog(
                title: Text('Delete?'),
                shadowColor: Colors.blue,
                elevation: 42,
                icon: Icon(Icons.delete),
                content: Text('Are you sure want to delete?'),
                actions: [
                  TextButton(onPressed: (){
                    //delete the item first
                    Navigator.pop(context);
                  }, child: Text('Yes')),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('No')),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('No')),
                ],
              );
            });
          }, child: Text('Alert Dialog')),
          ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                builder: (ctx){
              return SimpleDialog(
                contentPadding: EdgeInsets.symmetric(horizontal: 11),
                title: Text("Select a Language?"),
                children: [
                  SimpleDialogOption(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('Hindi'),
                  ),
                  SimpleDialogOption(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('English'),
                  ),
                  SimpleDialogOption(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('German'),
                  ),
                  SimpleDialogOption(

                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('French'),
                  ),
                ],
              );
            });
          }, child: Text('Simple Dialog')),
          ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                builder: (ctx){
              return AboutDialog(
                applicationVersion: "v1.0",
                applicationName: "Classico",
                applicationIcon: Icon(Icons.ac_unit_rounded),
                applicationLegalese: "This app is About..",
              );
            });
          }, child: Text('About Dialog')),
          ElevatedButton(onPressed: (){
            showGeneralDialog(
              barrierLabel: "Custom",
              barrierDismissible: true,
                context: context,
                pageBuilder: (_, __, ___){
                  return Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                      ),
                      height: 250,
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Add Note'),
                              TextField(),
                              TextField(),
                              Row(
                                children: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('Add')),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('Cancel'))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }, child: Text('Custom Dialog')),
          ElevatedButton(onPressed: () async{
            var selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000, 2, 30),
                lastDate: DateTime.now());
            if(selectedDate!=null) {
              print("Selecteddate: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
            }
          }, child: Text('Date Picker')),
          ElevatedButton(onPressed: () async{
            var selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(DateTime.now())
            );
            if(selectedTime!=null) {
              print("Selecteddate: ${selectedTime.hour}:${selectedTime.minute}");
            }
          }, child: Text('Time Picker')),

        ],
      ),
    );
  }
}
