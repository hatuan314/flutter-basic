import 'package:reminders_app/reminders_app/presentation/model/group.dart';

class HomeState {
  int l1 = 0, l2 = 0, l3 = 0;
  List<Group> MyLists = [];

  HomeState({this.l1, this.l2, this.l3, this.MyLists});
  HomeState update({int l1 , l2  , l3 ,
  List<Group> MyLists})=> HomeState(l1:l1?? this.l1, l2:l2?? this.l2, l3:l3?? this.l3, MyLists:MyLists?? this.MyLists);
}