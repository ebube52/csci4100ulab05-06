import 'package:flutter/material.dart';

class Friend{
  String? SID;
  String? Grade;


  Friend({this.SID,this.Grade});

  String toString() {
    return "$SID $Grade ";
  }
}

class FriendListBLoC with ChangeNotifier{
  List<Friend> _friends = [
    Friend(SID: "1000000001",
        Grade: "B-"
    ),
    Friend(SID: "1000000002",
        Grade: "C+"
    ),
    Friend(SID: "1000000003",
        Grade: "D"
    ),
  ];

  List<Friend> get friends => _friends;

  set friends(newFriendList){
    _friends = newFriendList;
    notifyListeners();
  }
  addFriend(newFriend){
    _friends.add(newFriend);
    notifyListeners();
  }

}