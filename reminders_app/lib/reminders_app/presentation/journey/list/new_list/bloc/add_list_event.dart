import 'package:flutter/cupertino.dart';

abstract class AddListEvent {

}

class SelectColorEvent extends AddListEvent {
  final Color color;

  SelectColorEvent({@required this.color});
}