import 'package:flutter/cupertino.dart';

abstract class ListEvent{}

class UpdateListEvent extends ListEvent{
final int index;
  UpdateListEvent({@required this.index});
}