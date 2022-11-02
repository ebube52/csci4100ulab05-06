import 'package:flutter/material.dart';
import 'friends.dart';
import 'friend_list.dart';
import 'package:provider/provider.dart';

import 'controller/add_Grade.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FriendListBLoC()),
    ],
    child: MyApp(),
  )
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms and SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Forms and SQLite'),
      routes: {
        '/addGrade' : (context) => AddGradeWidget(title: "Add Grade"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () =>{
                  debugPrint('Working!'), _editGrade()
                }
              // debugPrint('Clicked'
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () =>{
                debugPrint('Working!'), _deleteGrade()
              },
            )
          ]

      ),
      body: FriendListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddFriendWidget,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );


  }

  void _addGrade() {
    var event = Navigator.pushNamed(context, '/GradeShower');
  }


  void _editGrade() {
    var event = Navigator.pushNamed(context, '/GradeShower');
  }

  void _deleteGrade() {
    var event = Navigator.pushNamed(context, '/GradeShower');
  }


  Future<void> showAddFriendWidget() async{
    var friend = await Navigator.pushNamed(context, '/addGrade');
    print("New Grade: $friend");
  }

}