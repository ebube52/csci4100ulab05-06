import 'package:flutter/material.dart';
import 'package:untitled2/friends.dart';
import 'package:provider/provider.dart';

class AddGradeWidget extends StatefulWidget {
  AddGradeWidget({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  State<AddGradeWidget> createState() => _AddGradeWidgetState();
}

class _AddGradeWidgetState extends State<AddGradeWidget> {
  var formKey = GlobalKey<FormState>();

  String? SID;
  String? Grade;

  TextStyle style = TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    FriendListBLoC friendListBLoC = Provider
        .of<FriendListBLoC>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              style: style,
              decoration: InputDecoration(
                labelText: "SID:",
              ),
              onChanged: (value){
                SID = value;
              },
            ),

            TextFormField(
              style: style,
              decoration: InputDecoration(
                labelText: "Grade",
              ),
              onChanged: (value){
                Grade = value;
              },
            ),

            ElevatedButton(
                onPressed: (){
                  Friend newFriend = Friend(
                    SID: SID,
                    Grade: Grade,
                  );
                  friendListBLoC.addFriend(newFriend);
                  Navigator.of(context).pop(newFriend);
                },
                child: Text("Save", style: style,)
            ),

          ],
        ),
      ),
    );
  }
}